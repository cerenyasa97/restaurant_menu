import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/image/project_image.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'sub_menu_list.dart';

class SelectFoodsScreen extends StatelessWidget {
  final Item menuItem;
  final String title;

  const SelectFoodsScreen(
      {Key key, @required this.menuItem, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        label: ProjectText(
          text: AppConstants.ADD_BUTTON_LABEL,
          color: Colors.white,
          weight: FontWeight.w600,
          textSize: 18,
        ),
        icon: Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            ProjectImage(
              imagePath: "assets/" + menuItem.image,
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
                child: ListView(clipBehavior: Clip.none, children: [
                  ProjectText(
                    text: title,
                    textSize: 30,
                    weight: FontWeight.w800,
                  ),
                  context.mediumSizedBoxHeight,
                  Visibility(
                    child: SubMenuList(menuItem: menuItem),
                    visible: menuItem.subMenus != null,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
