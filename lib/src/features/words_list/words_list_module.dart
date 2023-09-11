import 'package:dictionary_furini/src/features/favorites/favorites_store.dart';
import 'package:dictionary_furini/src/features/words_list/data/local_repository/words_list_local_repository.dart';
import 'package:dictionary_furini/src/features/words_list/data/repository/words_list_repository.dart';
import 'package:dictionary_furini/src/features/words_list/data/words_list_repository_interface.dart';
import 'package:dictionary_furini/src/features/words_list/domain/usecases/get_word_details.dart';
import 'package:dictionary_furini/src/features/words_list/domain/usecases/get_word_list.dart';
import 'package:dictionary_furini/src/features/words_list/presentation/home/words_list_screen.dart';
import 'package:dictionary_furini/src/features/words_list/presentation/home/words_list_store.dart';
import 'package:dictionary_furini/src/features/words_list/presentation/word/word_details_screen.dart';
import 'package:dictionary_furini/src/features/words_list/presentation/word/word_details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:dictionary_furini/src/shared/infrastructure/http/custom_dio.dart';
import 'package:dictionary_furini/src/shared/views/root_layout.dart';
import 'package:flutter_tts/flutter_tts.dart';

class WordsListModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CustomDio()),
    Bind((i) => WordsListRepository()),
    Bind((i) => WordsListLocalRepository()),
    Bind(
      (i) => GetWordListUseCase(
          i.get<IWordsListRepository>(), i.get<WordsListLocalRepository>()),
    ),
    Bind(
      (i) => GetWordDetailsUseCase(
          i.get<IWordsListRepository>(), i.get<WordsListLocalRepository>()),
    ),
    Bind.lazySingleton((i) => WordsListStore()),
    Bind.lazySingleton((i) => WordDetailsStore()),
    Bind.lazySingleton((i) => FavoritesStore()),
    Bind.lazySingleton((i) => FlutterTts()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => RootLayout(
        currentIndex: 0,
        child: const WordsListScreen(),
      ),
    ),
    ChildRoute(
      '/details/:word',
      child: (_, args) => RootLayout(
        currentIndex: 0,
        child: WordDetailsScreen(word: args.data['word']),
      ),
    ),
  ];
}
