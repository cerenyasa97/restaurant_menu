import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/core/constants/methods/scroll_widget_behavior.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:restaurant_menu/core/init/navigation/pages_import.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';

abstract class MenuBaseView extends StatefulWidget {
  const MenuBaseView({Key key}) : super(key: key);
}

abstract class MenuBaseState<Page extends MenuBaseView> extends State<Page> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppConstants.BACKGROUND_COLOR,
        body: SafeArea(
          child: Padding(
            padding: context.pagesEdgeInsets,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
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
                      ],
                    ),
                    Stack(
                      children: [
                        FloatingActionButton(
                          backgroundColor: Colors.deepPurple,
                          onPressed: () => NavigationService.instance
                              .navigatorPush(context, Pages.PAYMENT),
                          child: Icon(
                            Icons.shopping_basket,
                          ),
                        ),
                        Visibility(
                          visible: context
                              .watch<MenuProvider>()
                              .orderList
                              .length > 0,
                          child: Positioned(
                              right: 0,
                              child: CircleAvatar(
                                radius: context.dynamicWidth(10),
                                backgroundColor: Colors.white,
                                child: ProjectText(
                                  text: context
                                      .watch<MenuProvider>()
                                      .orderList
                                      .length
                                      .toString(),
                                  color: Colors.deepPurple,
                                ),
                              )),
                        )
                      ],
                    )
                  ],
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
