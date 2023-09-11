import 'package:dictionary_furini/src/features/favorites/favorites_store.dart';
import 'package:dictionary_furini/src/features/history/history_store.dart';
import 'package:dictionary_furini/src/features/words_list/domain/usecases/get_word_details.dart';
import 'package:dictionary_furini/src/features/words_list/domain/usecases/get_word_list.dart';

import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'word_details_store.g.dart';

// This is the class used by rest of your codebase
class WordDetailsStore = _WordDetailsStore with _$WordDetailsStore;

// The store-class
abstract class _WordDetailsStore with Store {
  late GetWordDetailsUseCase getWordDetailsUseCase =
      Modular.get<GetWordDetailsUseCase>();
  HistoryStore historyStore = Modular.get<HistoryStore>();
  FavoritesStore favoritesStore = Modular.get<FavoritesStore>();

  @observable
  Word? wordDetails;

  @observable
  bool hasError = false;

  @observable
  String? errorMessage = '';
  @observable
  bool loading = false;

  @observable
  bool isFavorite = false;

  final LocalStorage storage = LocalStorage('wordsAlreadySearched');
  final LocalStorage favoritesStorage = LocalStorage('favoriteWords');

  List<dynamic> searchedWords = [];

  resetState() {
    loading = false;
    errorMessage = '';
    hasError = false;
    isFavorite = false;
  }

  init(word) async {
    await checkIfIsFavorite(word);
  }

  Future<void> favoriteWord(favoriteWord) async {
    await favoritesStore.addToFavoritesList(favoriteWord);
    var wordAlreadyFavorite = await favoritesStorage.getItem(favoriteWord);
    if (wordAlreadyFavorite == null) {
      await favoritesStorage.setItem(favoriteWord, favoriteWord);
      isFavorite = true;
    } else {
      await favoritesStorage.deleteItem(favoriteWord);
      isFavorite = false;
    }
  }

  Future<void> checkIfIsFavorite(word) async {
    var favoriteWordFound = await favoritesStorage.getItem(word);
    if (favoriteWordFound == null) {
      isFavorite = false;
    } else {
      isFavorite = true;
    }
  }

  Future<void> getWordDetails(String selectedWord) async {
    loading = true;
    try {
      // final wordsList = box.get("wordsAlreadySearched");

      var tmpList = await storage.getItem("wordsList");

      if (tmpList != null) {
        searchedWords = tmpList;
      }
      wordDetails = await getWordDetailsUseCase.call(selectedWord);
      historyStore.addToHistory(wordDetails?.word ?? "", wordDetails);
      loading = false;
      hasError = false;
    } catch (error) {
      errorMessage = 'There was not possible to find this word';
      hasError = true;
      loading = false;
    }
  }
}
