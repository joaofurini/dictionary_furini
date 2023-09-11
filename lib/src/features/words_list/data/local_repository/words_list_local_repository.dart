import 'dart:convert';

import 'package:dictionary_furini/src/features/words_list/data/words_list_repository_interface.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';
import 'package:flutter/services.dart';
import 'package:localstorage/localstorage.dart';

class WordsListLocalRepository implements IWordsListRepository {
  LocalStorage storage = LocalStorage("words");
  @override
  Future<dynamic> fetchData() async {
    var dictionary = storage.getItem("dictionary");
    if (dictionary == null) {
      final String response =
          await rootBundle.loadString('assets/words_dictionary.json');

      storage.setItem("dictionary", jsonDecode(response));
      print(response);
      try {
        return storage.getItem("dictionary");
      } catch (error) {
        throw Exception('Failed to load user data');
      }
    } else {
      return storage.getItem("dictionary");
    }
  }

  @override
  Future<Word> fetchDetails(String word) async {
    // final String response = await rootBundle.loadString('assets/words.json');
    // print(response);
    final LocalStorage storage = LocalStorage('wordsAlreadySearched');

    dynamic wordUnformated = storage.getItem(word);
    try {
      return Word.fromJson(wordUnformated);
    } catch (error) {
      throw Exception('Failed to load user data');
    }
  }
}
