import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      // case NFTDetailsScreen.routeName:
      //   final id = settings.arguments as String;
      //   return MaterialPageRoute(builder: (_) => NFTDetailsScreen(id: id));
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                "Error",
                textAlign: TextAlign.center,
              )),
            ));
  }
}
