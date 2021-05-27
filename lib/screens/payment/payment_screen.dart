import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/core/components/image/circle_image.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/constants/text/text_constants.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              NavigationService.instance
                  .navigatorPushAndRemoveUntil(context, Pages.MAIN_MENU);
            },
            label: ProjectText(
              text: TextConstants.ADD_BUTTON,
              color: Colors.white,
              weight: FontWeight.w600,
              textSize: 18,
            ),
            icon: Icon(Icons.add),
          ),
          context.mediumSizedBoxHeight,
          FloatingActionButton.extended(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              context.read<MenuProvider>().clearOrderedList();
              NavigationService.instance
                  .navigatorPushAndRemoveUntil(context, Pages.MAIN_MENU);
            },
            label: ProjectText(
              text: TextConstants.PAY_BUTTON,
              color: Colors.white,
              weight: FontWeight.w600,
              textSize: 18,
            ),
            icon: Icon(Icons.payment),
          )
        ],
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: context.pagesEdgeInsets,
        child: Consumer<MenuProvider>(
          builder: (context, menuProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectText(
                  text: TextConstants.PAYMENT_TITLE,
                  textSize: 40,
                  color: Colors.white,
                  weight: FontWeight.w600,
                ),
                context.largeSizedBoxHeight,
                Column(
                  children: menuProvider.orderList
                      .map((Item item) => ListTile(
                            leading: CircleImage(
                              image: "assets/" + item.image,
                              color: Colors.black,
                            ),
                            title: ProjectText(
                              text: item.name,
                              color: Colors.white,
                              textSize: 20,
                            ),
                            trailing: ProjectText(
                              text: item.price == null
                                  ? "-"
                                  : item.price.toString() + " TL",
                              color: Colors.white38,
                              textSize: 16,
                            ),
                          ))
                      .toList(),
                ),
                ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: ProjectText(
                        text: TextConstants.PRICE_LABEL,
                        color: Colors.white,
                        textSize: 20,
                      ),
                    ),
                    trailing: ProjectText(
                      text:
                          menuProvider.price.toStringAsFixed(2) + " TL" ?? "-",
                      color: Colors.white38,
                      textSize: 16,
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
