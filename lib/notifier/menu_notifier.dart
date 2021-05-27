import 'package:flutter/cupertino.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/utils/service/json_service.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuElement> menuList;
  MenuElement itemList;
  List<Item> orderList = [];
  double price = 0;

  fetchMenu() async {
    var data = await JsonService.loadLocalJson();
    Menu menu = Menu.fromMap(data);
    menuList = menu.menus;
    notifyListeners();
  }

  getValueWithKey(String key) {
    menuList.forEach((item) {
      if (item.key == key) itemList = item;
    });
  }

  addItem(List<Item> itemList, int index, bool flag) {
    int elementIndex;
    int sideFoodCount = 0;

    for (Item element in itemList) {
      if (flag && sideFoodCount < 1) {
        elementIndex = -1;
        sideFoodCount += 1;
      } else {
        elementIndex = orderList.indexWhere((item) {
          return item == element;
        });
        if (elementIndex != -1) break;
      }
    }

    if (elementIndex == -1) {
      orderList.add(itemList[index]);
      if (itemList[index].price != null) {
        var itemPrice = itemList[index].price;
        double lastPrice = 0;
        if(itemPrice is String) lastPrice = double.parse(itemPrice.replaceFirst(RegExp(","), "."));
        else if (itemPrice is int) lastPrice = itemPrice.toDouble();
        else if (itemPrice is double) lastPrice = itemPrice;
        price += lastPrice;
      }
    } else {
      orderList.removeAt(elementIndex);
      orderList.insert(elementIndex, itemList[index]);
    }
    print(price);
    print(orderList);
    notifyListeners();
  }

  clearOrderedList() {
    orderList.clear();
    price = 0;
    print(orderList);
    print(price);
    notifyListeners();
  }
}
