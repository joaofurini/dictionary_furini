import 'package:flutter_modular/flutter_modular.dart';

import 'package:dictionary_furini/src/features/history/view/history_screen.dart';

import 'package:dictionary_furini/src/shared/views/root_layout.dart';

class HistoryModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => HistoryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => RootLayout(
        currentIndex: 1,
        child: const HistoryPage(),
      ),
    ),
  ];
}
