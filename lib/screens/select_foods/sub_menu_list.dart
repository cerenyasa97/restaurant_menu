import 'package:restaurant_menu/core/components/container/circular_corner_container.dart';
import 'package:restaurant_menu/core/components/image/cliprrect_image.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';

class SubMenuList extends StatelessWidget {
  final Item menuItem;

  const SubMenuList({Key key, this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
      context.read<MenuProvider>().getValueWithKey(menuItem.subMenus[index]);
      final itemList = context.read<MenuProvider>().itemList;
      return Padding(
          padding: context.menuItemEdgeInsets,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProjectText(
              text: itemList.orderTag ?? "Food Title",
              textSize: 20,
              weight: FontWeight.w600,
            ),
            context.lowSizedBoxHeight,
            ProjectText(
              text: itemList.description,
              textSize: 17,
              color: Colors.grey.shade700,
            ),
            context.lowSizedBoxHeight,
            Container(
                width: double.maxFinite,
                height: context.dynamicHeight(170),
                child: Theme(
                    data: Theme.of(context)
                        .copyWith(accentColor: Colors.deepPurple),
                    child: ListView.separated(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => Container(
                        width: context
                            .dynamicWidth(AppConstants.SUB_MENU_BLANKS / 2),
                      ),
                      itemBuilder: (context, index2) {
                        return CircularCornerContainer(
                          width: context.dynamicWidth(120),
                          padding: context.lowEdgeInsets,
                          child: GestureDetector(
                            onTap: () {
                              bool flag = false;
                              if(itemList.orderTag == "Menü Yan Lezzetler") flag = true;
                              context.read<MenuProvider>().addItem(itemList.items, index2, flag);
                            },
                            child: Column(
                              children: [
                                Flexible(
                                    flex: 7,
                                    child: ClipRRectImage(
                                      imagePath:
                                      "assets/" + itemList.items[index2].image,
                                    )),
                                Flexible(
                                  flex: 3,
                                  child: Center(
                                    child: ProjectText(
                                      align: TextAlign.center,
                                      text: itemList.items[index2].name ?? "Food",
                                      textSize: 15,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 3,
                                  child: Center(
                                    child: ProjectText(
                                      align: TextAlign.center,
                                      text: itemList.items[index2].price != null
                                          ? itemList.items[index2].price
                                          .toString() +
                                          " TL"
                                          : "-",
                                      textSize: 17,
                                      weight: FontWeight.w800,
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: itemList.items.length,
                    )))
          ])
      );
    }, childCount: 5));
  }
}