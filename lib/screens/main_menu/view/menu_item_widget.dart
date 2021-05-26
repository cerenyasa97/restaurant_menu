import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/core/components/image/cliprrect_image.dart';
import 'package:restaurant_menu/core/components/container/circular_corner_container.dart';

class MenuItemWidget extends StatelessWidget {
  final Item menuItem;

  const MenuItemWidget({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigatorPush(context,
            menuItem.items != null ? Pages.SUB_MENU : Pages.SELECT_FOOD,
            variable: menuItem.items != null ? menuItem.items : menuItem,
            title: menuItem.name);
      },
      child: CircularCornerContainer(
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRectImage(
                  imagePath: "assets/" + menuItem.image,
                ),
              ),
            ),
            Flexible(
              child: ProjectText(
                text: menuItem.name,
                align: TextAlign.center,
                textSize: 25,
                weight: FontWeight.w600,
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
