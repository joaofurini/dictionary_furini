import 'package:collection/collection.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = FavoritesStoreBase with _$FavoritesStore;

abstract class FavoritesStoreBase with Store {
  @observable
  int counter = 0;

  @observable
  List<dynamic> favoriteWords = [];

  final LocalStorage storage = LocalStorage('favoriteWords');

  Future<void> removeItemFromFavorites(String word) async {
    final favoriteWordIndex =
        favoriteWords.where((element) => element == word).toList()[0];

    favoriteWords.remove(favoriteWordIndex);

    await storage.deleteItem(word);
    await storage.setItem("favoriteWords", favoriteWords);

    print(favoriteWords);
  }

  init() {
    var tmpList = storage.getItem("favoriteWords");

    if (tmpList != null) {
      favoriteWords = tmpList;
    }

    print(tmpList);
  }

  void addToFavorites(String word, Word? wordModel) async {
    print(storage.getItem("favoriteWords"));
    favoriteWords = storage.getItem("favoriteWords");
    final usernameAlreadyInTheList =
        favoriteWords.where((element) => element == word);

    if (usernameAlreadyInTheList.isEmpty) {
      favoriteWords.add(word);
      await storage.setItem("favoriteWords", favoriteWords);
      await storage.setItem(word, wordModel);
    }
  }

  Future<void> addToFavoritesList(
    String word,
  ) async {
    var tmpList = storage.getItem("favoriteWords");

    if (tmpList != null) {
      favoriteWords = tmpList;
      final favoriteWordAlreadyOnTheList =
          favoriteWords.where((element) => element == word);

      if (favoriteWordAlreadyOnTheList.isEmpty) {
        favoriteWords.add(word);
        await storage.setItem("favoriteWords", favoriteWords);
      } else {
        favoriteWords.remove(word);
        await storage.setItem("favoriteWords", favoriteWords);
      }
    } else {
      favoriteWords.add(word);
      await storage.setItem("favoriteWords", favoriteWords);
    }
  }

  List<dynamic> favoriteWordsList() {
    print(favoriteWords);
    var tmp = storage.getItem("favoriteWords");

    print(tmp);
    return favoriteWords.reversed.toList();
  }
}
