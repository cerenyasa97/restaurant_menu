import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';
import 'package:restaurant_menu/screens/payment/payment_screen.dart';
import 'pages_import.dart';

class NavigationService {
  static NavigationService _instance;

  static NavigationService get instance =>
      _instance ??= NavigationService._internal();

  NavigationService._internal();

  static dynamic generatePageRoute(Pages page, {var variable, String title}) {
    switch (page) {
      case Pages.MAIN_MENU:
        return MainMenuScreen();
      case Pages.SUB_MENU:
        return SubMenuScreen(menuElement: variable, title: title,);
      case Pages.SELECT_FOOD:
        return SelectFoodsScreen(menuItem: variable, title: title,);
      case Pages.PAYMENT:
        return PaymentScreen();
    }
  }

  static PageRouteBuilder<dynamic> generateSlidePageRouteBuilder(Pages page,
      {var variable, String title}) {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            generatePageRoute(page, variable: variable, title: title),
        transitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: animation.drive(
                Tween<Offset>(begin: Offset(0.0, 1.0), end: Offset.zero)),
            child: child,
          );
        });
  }

  void navigatorPush(BuildContext context, Pages page, {var variable, String title}) {
    Navigator.of(context)
        .push(generateSlidePageRouteBuilder(page, variable: variable, title: title));
  }

  void navigatorPushReplacement(BuildContext context, Pages page,
      {var variable, String title}) {
    Navigator.of(context).pushReplacement(
        generateSlidePageRouteBuilder(page, variable: variable, title: title));
  }

  void navigatorPushAndRemoveUntil(BuildContext context, Pages page,
      {var variable, String title}) {
    Navigator.of(context).pushAndRemoveUntil(
        generateSlidePageRouteBuilder(page, variable: variable, title: title), (route) => false);
  }

  void navigatorPop(BuildContext context) => Navigator.pop(context);
}
