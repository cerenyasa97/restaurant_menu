import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/core/base/menu_base_view.dart';
import 'package:restaurant_menu/core/components/progress_indicator/custom_progress_indicator.dart';
import 'package:restaurant_menu/core/constants/text/text_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';
import 'menu_item_widget.dart';

class MainMenuScreen extends MenuBaseView {
  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends MenuBaseState<MainMenuScreen> {
  @override
  Widget menu() => Consumer<MenuProvider>(
        builder: (context, menuProvider, child) {
          return menuProvider.menuList == null
              ? Center(child: CustomProgressIndicator())
              : GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: context.dynamicHeight(24),
                  crossAxisSpacing: context.dynamicWidth(24),
                  childAspectRatio: (17 / 20),
                  children: menuProvider.menuList[0].items
                      .map((menuItem) => MenuItemWidget(menuItem: menuItem))
                      .toList(),
                );
        },
      );

  @override
  String title1() => TextConstants.MAIN_LABEL;

  @override
  String title2() => TextConstants.MENU_LABEL;
}
