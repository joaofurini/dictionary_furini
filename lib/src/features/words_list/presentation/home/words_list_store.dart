import 'package:dictionary_furini/src/features/history/history_store.dart';
import 'package:dictionary_furini/src/features/words_list/domain/usecases/get_word_list.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'words_list_store.g.dart';

class WordsListStore = _WordsListStore with _$WordsListStore;

abstract class _WordsListStore with Store {
  late GetWordListUseCase getWordsUseCase = Modular.get<GetWordListUseCase>();
  HistoryStore historyStore = Modular.get<HistoryStore>();

  @observable
  dynamic wordsList = {};

  @observable
  List<String> tmpList = [];

  @observable
  List<String> formatedWordsList = [];

  @observable
  bool loading = false;

  @action
  Future<void> fetchData() async {
    loading = true;
    final response = await getWordsUseCase.call('joaofurini');
    wordsList = response;

    for (final key in wordsList.keys) {
      formatedWordsList.add(key);
    }
    // formatedWordsList = tmpList;
    loading = false;
  }
}
