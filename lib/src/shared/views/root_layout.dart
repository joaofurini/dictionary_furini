import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'adaptive_navigation.dart';

class RootLayout extends StatelessWidget {
  RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _switcherKey = ValueKey('switcherKey');
  static const _navigationRailKey = ValueKey('navigationRailKey');

  List<NavigationDestination> navigationList = [
    const NavigationDestination(
      label: 'Words list',
      icon: Icon(Icons.home),
    ),
    const NavigationDestination(
      label: 'History',
      icon: Icon(Icons.history),
    ),
    const NavigationDestination(
      label: 'Favorites',
      icon: Icon(Icons.favorite),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      void onSelected(int index) {
        switch (index) {
          case 0:
            Modular.to.navigate('/');
            break;
          case 1:
            Modular.to.navigate('/history');

            break;
          case 2:
            Modular.to.navigate('/favorites');
            break;

          default:
        }
      }

      return AdaptiveNavigation(
        key: _navigationRailKey,
        onSelected: () {},
        destinations: navigationList,
        selectedIndex: currentIndex,
        onDestinationSelected: onSelected,
        child: Column(
          children: [
            Expanded(
              child: _Switcher(
                key: _switcherKey,
                child: child,
              ),
            ),
            // if (current != null) const BottomBar(),
          ],
        ),
      );
    });
  }
}

class _Switcher extends StatelessWidget {
  final bool isDesktop = defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
  final Widget child;

  _Switcher({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? child
        : AnimatedSwitcher(
            key: key,
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: child,
          );
  }
}
