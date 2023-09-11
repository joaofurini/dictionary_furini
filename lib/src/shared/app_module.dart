import 'package:dictionary_furini/src/features/favorites/favorites_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dictionary_furini/src/features/history/history_module.dart';
import 'package:dictionary_furini/src/features/history/history_store.dart';
import 'package:dictionary_furini/src/features/words_list/words_list_module.dart';

import 'package:dictionary_furini/src/shared/infrastructure/http/custom_dio.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CustomDio()),
    Bind.lazySingleton((i) => HistoryStore()),
    // Bind.lazySingleton(
    //   (i) => AuthRepository(
    //     i.get<Dio>(),
    //   ),
    // ),
    // Bind.lazySingleton(
    //   (i) => LogRepository(),
    // ),
    // Bind.lazySingleton(
    //   (i) => AppDrawerStore(
    //     i<IAuthRepository>(),
    //   ),
    // ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: WordsListModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/history',
      module: HistoryModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/favorites',
      module: FavoritesModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
