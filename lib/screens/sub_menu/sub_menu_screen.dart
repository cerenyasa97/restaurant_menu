import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/base/menu_base_view.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/screens/main_menu/view/menu_item_widget.dart';

class SubMenuScreen extends MenuBaseView {
  final List<Item> menuElement;
  final String title;

  SubMenuScreen({@required this.menuElement, @required this.title});

  @override
  _SubMenuScreenState createState() => _SubMenuScreenState();
}

class _SubMenuScreenState extends MenuBaseState<SubMenuScreen> {
  List<String> nameList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameList = widget.title.split(" ");
  }

  @override
  Widget menu() => GridView.count(
    clipBehavior: Clip.none,
    crossAxisCount: 2,
    mainAxisSpacing: context.dynamicHeight(24),
    crossAxisSpacing: context.dynamicWidth(24),
    childAspectRatio: (17 / 20),
    children: widget.menuElement
        .map((menuItem) => MenuItemWidget(menuItem: menuItem))
        .toList(),
  );

  @override
  String title1() => nameList.length == 1
      ? nameList.first
      : nameList.sublist(0, nameList.length - 1).join(" ");

  @override
  String title2() => nameList.length > 1 ? nameList.last : null;
}
