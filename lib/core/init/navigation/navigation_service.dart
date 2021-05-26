import 'package:flutter/material.dart';
import 'pages_import.dart';

class NavigationService {
  static NavigationService _instance;

  static NavigationService get instance =>
      _instance ??= NavigationService._internal();

  NavigationService._internal();

  static dynamic generatePageRoute(Pages page, {var variable}) {
    switch (page) {
      case Pages.MAIN_MENU:
        return MainMenuScreen();
    }
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(Pages page,
      {var variable}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            generatePageRoute(page, variable: variable),
        transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
                Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)),
            child: child,
          );
        });
  }

  void navigatorPush(BuildContext context, Pages page, {var variable}) {
    Navigator.of(context)
        .push(generateSlidePageRouteBuilder(page, variable: variable));
  }

  void navigatorPushReplacement(BuildContext context, Pages page,
      {var variable}) {
    Navigator.of(context).pushReplacement(
        generateSlidePageRouteBuilder(page, variable: variable));
  }
}
