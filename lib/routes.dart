import 'package:finam_task/screens/detailed/detailed_screen.dart';
import 'package:finam_task/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static const String main = '/main';
  static const String detailed = '/detailed';

  static Map<String, WidgetBuilder> routes() => {
        main: (context) => const MainScreen(),
        detailed: (context) => const DetailedScreen(),
      };
}
