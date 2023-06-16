import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:second_challenge/providers/model_provider.dart';

import '../screens/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider<ModelProvider>(
                  create: (context) => ModelProvider(),
                  child: HomeScreen(),
                ));
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
