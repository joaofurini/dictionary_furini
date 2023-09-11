import 'package:dictionary_furini/src/features/words_list/data/words_list_repository_interface.dart';
import 'package:dictionary_furini/src/features/words_list/domain/model/word_model.dart';
import 'package:localstorage/localstorage.dart';

class GetWordDetailsUseCase {
  GetWordDetailsUseCase(
    IWordsListRepository wordsListRepository,
    this._localRepository,
  ) : _repository = wordsListRepository;

  final IWordsListRepository _repository;
  final IWordsListRepository _localRepository;
  final LocalStorage storage = LocalStorage('wordsAlreadySearched');

  Future<Word> call(String word) async {
    dynamic searchedWords = storage.getItem("wordsList");

    if (searchedWords != null && searchedWords.contains(word)) {
      return _localRepository.fetchDetails(word);
    } else {
      return await _repository.fetchDetails(word);
    }
  }
}
