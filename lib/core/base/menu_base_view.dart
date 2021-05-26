import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/core/constants/methods/scroll_widget_behavior.dart';

abstract class MenuBaseView extends StatefulWidget {
  const MenuBaseView({Key key}) : super(key: key);
}

abstract class MenuBaseState<Page extends MenuBaseView> extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.BACKGROUND_COLOR,
        body: SafeArea(
          child: Padding(
            padding: context.pagesEdgeInsets,
            child: ListView(
              children: [
                ProjectText(
                  text: title1(),
                  textSize: 50,
                  weight: FontWeight.w800,
                ),
                Visibility(
                  child: ProjectText(
                    text: title2(),
                    textSize: 40,
                    weight: FontWeight.w500,
                  ),
                  visible: title2() != null,
                ),
                context.largeSizedBoxHeight,
                ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: Container(
                      margin: context.menuItemEdgeInsets,
                      height: context.dynamicHeight(640),
                      child: menu(),
                    ))
              ],
            ),
          ),
        ));
  }

  String title1();

  String title2();

  Widget menu();
}
