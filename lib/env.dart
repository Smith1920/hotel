import 'package:flutter/material.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static late String baseAPiUrl;
  static late String title;
  static late Environment _environment;
  static late MaterialColor color;
  static Environment get environment => _environment;
  static setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          baseAPiUrl = 'https://api-dev.com/';
          title = 'Flutter Flavors Dev';
          color = Colors.red;
          break;
        }
      case Environment.prod:
        {
          baseAPiUrl = 'https://api-prod.com/';
          title = 'Flutter Flavors Prod';
          color = Colors.grey;
          break;
        }
    }
  }
}
