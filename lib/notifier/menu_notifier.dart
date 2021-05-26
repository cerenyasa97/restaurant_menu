import 'package:flutter/cupertino.dart';
import 'package:restaurant_menu/model/menu_model.dart';
import 'package:restaurant_menu/utils/service/json_service.dart';

class MenuProvider extends ChangeNotifier{

  List<MenuElement> menuList;

  fetchMenu() async{
    var data = await JsonService.loadLocalJson();
    Menu menu = Menu.fromMap(data);
    menuList = menu.menus;
    notifyListeners();
  }
}