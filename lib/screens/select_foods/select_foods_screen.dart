import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/image/project_image.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/constants/methods/scroll_widget_behavior.dart';
import 'package:restaurant_menu/core/constants/text/text_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';

import 'sub_menu_list.dart';
import 'package:provider/provider.dart';

class SelectFoodsScreen extends StatefulWidget {
  final Item menuItem;
  final String title;

  const SelectFoodsScreen(
      {Key key, @required this.menuItem, @required this.title})
      : super(key: key);

  @override
  _SelectFoodsScreenState createState() => _SelectFoodsScreenState();
}

class _SelectFoodsScreenState extends State<SelectFoodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () => NavigationService.instance.navigatorPushReplacement(context, Pages.PAYMENT),
        label: ProjectText(
          text: TextConstants.OK_BUTTON_LABEL,
          color: Colors.white,
          weight: FontWeight.w600,
          textSize: 18,
        ),
        icon: Icon(Icons.done),
      ),
      backgroundColor: Colors.black,
      body: WillPopScope(
        onWillPop: () async {
          context.read<MenuProvider>().clearOrderedList();
          return true;
        },
        child: _body(),
      ),
    );
  }

  ScrollConfiguration _body() {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Container(
        height: context.height - 0,
        width: context.width,
        child: Stack(
          children: [
            ProjectImage(
              imagePath: "assets/" + widget.menuItem.image,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            AppConstants.SELECT_FOOD_CORNER_RADIUS),
                        topLeft: Radius.circular(
                            AppConstants.SELECT_FOOD_CORNER_RADIUS),
                      ),
                      color: AppConstants.BACKGROUND_COLOR),
                  height: context.dynamicHeight(570),
                  padding: context.selectFoodsEdgeInsets,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        pinned: false,
                        snap: false,
                        floating: false,
                        expandedHeight: 60,
                        backgroundColor: Colors.transparent,
                        flexibleSpace: FlexibleSpaceBar(
                          title: ProjectText(
                            text: widget.title,
                            textSize: 20,
                            weight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Visibility(
                        child: SubMenuList(menuItem: widget.menuItem),
                        visible: widget.menuItem.subMenus != null,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
