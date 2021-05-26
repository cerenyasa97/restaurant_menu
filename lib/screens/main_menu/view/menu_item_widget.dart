import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/text/custom_rich_text.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/constants/text/text_constants.dart';
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
        //NavigationService.instance.navigatorPush(context, Pages.MAIN_MENU);
      },
      child: CircularCornerContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRectImage(
              imagePath: "assets/" + menuItem.image,
            ),
            CustomRichText(text: menuItem.name)
          ],
        ),
      ),
    );
  }
}
