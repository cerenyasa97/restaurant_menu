import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/core/components/image/cliprrect_image.dart';
import 'package:restaurant_menu/core/components/container/circular_corner_container.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';
import 'package:provider/provider.dart';

class MenuItemWidget extends StatelessWidget {
  final Item menuItem;

  const MenuItemWidget({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (menuItem.items == null) {
          double lastPrice;
          if(menuItem.price is String) lastPrice = double.parse(menuItem.price.replaceFirst(RegExp(","), "."));
          else if(menuItem.price is int) lastPrice = menuItem.price.toDouble();
          else lastPrice = menuItem.price;
          context.read<MenuProvider>().price = lastPrice;
              ;
        }
        print("********************************************\n" +
            menuItem.toString());
        if (menuItem.items != null)
          NavigationService.instance.navigatorPush(context, Pages.SUB_MENU,
              variable: menuItem.items, title: menuItem.name);
        else if (menuItem.items == null && menuItem.subMenus != null)
          NavigationService.instance.navigatorPush(context, Pages.SELECT_FOOD,
              variable: menuItem, title: menuItem.name);
        else {
          context.read<MenuProvider>().addSingleItem(menuItem);
          NavigationService.instance.navigatorPush(context, Pages.PAYMENT);
        }
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
