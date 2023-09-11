import 'package:dictionary_furini/src/features/words_list/data/words_list_repository_interface.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';

class GetWordListUseCase {
  GetWordListUseCase(
    IWordsListRepository wordsListRepository,
    this._localRepository,
  ) : _repository = wordsListRepository;

  final IWordsListRepository _repository;
  final IWordsListRepository _localRepository;
  Future<dynamic> call(String username) async {
    try {
      return await _localRepository.fetchData();
    } catch (error) {
      rethrow;
    }
  }
}
