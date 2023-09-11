import 'package:dictionary_furini/src/features/words_list/data/words_list_repository_interface.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';

import 'package:dictionary_furini/src/shared/infrastructure/http/custom_dio.dart';
import 'package:dio/dio.dart';

class WordsListRepository implements IWordsListRepository {
  CustomDio dio = CustomDio();
  static const String baseUrl = 'https://wordsapiv1.p.rapidapi.com/words';
  @override
  Future<dynamic> fetchData() async {
    print("chegou");
    try {
      final response = await dio.fetch(RequestOptions(
        baseUrl: '$baseUrl/users/',
      ));
      return response.data;
    } catch (error) {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Future<Word> fetchDetails(String? word) async {
    try {
      final response =
          await dio.fetch(RequestOptions(baseUrl: '$baseUrl/$word', headers: {
        "X-RapidAPI-Key": "69c4fe12a9mshfd17d4888b38bffp17a124jsn06d642a77d82",
        "X-RapidAPI-Host": "wordsapiv1.p.rapidapi.com"
      }));
      return Word.fromJson(response.data);
    } catch (error) {
      print(error);
      throw Exception('Failed to load user data');
    }
  }
}
