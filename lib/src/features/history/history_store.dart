import 'package:collection/collection.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = HistoryStoreBase with _$HistoryStore;

abstract class HistoryStoreBase with Store {
  @observable
  int counter = 0;

  @observable
  List<dynamic> searchedWords = [];

  final LocalStorage storage = LocalStorage('wordsAlreadySearched');

  void removeItemFromHistory(String username) {
    final usernameIndex =
        searchedWords.where((element) => element == username).toList()[0];

    searchedWords.remove(usernameIndex);

    print(searchedWords);
  }

  void addToHistory(String word, Word? wordModel) async {
    print(storage.getItem("wordsList"));

    dynamic tmpList = storage.getItem("wordsList");
    if (tmpList != null) {
      searchedWords = tmpList;
      final usernameAlreadyInTheList =
          searchedWords.where((element) => element == word);

      if (usernameAlreadyInTheList.isEmpty) {
        searchedWords.add(word);
        await storage.setItem("wordsList", searchedWords);
        await storage.setItem(word, wordModel);
      }
    } else {
      searchedWords.add(word);
      await storage.setItem("wordsList", searchedWords);
      await storage.setItem(word, wordModel);
    }
    // searchedWords = storage.getItem("wordsList");
  }

  List<dynamic> searchedWordsList() {
    return searchedWords.reversed.toList();
  }
}
