// To parse this JSON data, do
//
//     final menu = menuFromMap(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Menu menuFromMap(String str) => Menu.fromMap(json.decode(str));

String menuToMap(Menu data) => json.encode(data.toMap());

class Menu extends Equatable{
  Menu({
    this.menus,
  });

  List<MenuElement> menus;

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
        menus: List<MenuElement>.from(
            json["menus"].map((x) => MenuElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "menus": List<dynamic>.from(menus.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return 'Menu{menus: $menus}';
  }

  @override
  // TODO: implement props
  List<Object> get props => [this.menus];
}

class MenuElement extends Equatable {
  MenuElement({
    this.key,
    this.description,
    this.items,
    this.orderTag,
  });

  String key;
  String description;
  List<Item> items;
  String orderTag;

  factory MenuElement.fromMap(Map<String, dynamic> json) => MenuElement(
        key: json["key"],
        description: json["description"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        orderTag: json["orderTag"] == null ? null : json["orderTag"],
      );

  Map<String, dynamic> toMap() => {
        "key": key,
        "description": description,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
        "orderTag": orderTag == null ? null : orderTag,
      };

  @override
  String toString() {
    return 'MenuElement{key: $key, description: $description, items: $items, orderTag: $orderTag}';
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        this.key,
        this.description,
        this.items,
        this.orderTag,
      ];
}

class Item extends Equatable {
  Item({
    this.name,
    this.caption,
    this.image,
    this.items,
    this.price,
    this.subMenus,
  });

  String name;
  String caption;
  String image;
  List<Item> items;
  dynamic price;
  List<String> subMenus;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"] == null ? null : json["name"],
        caption: json["caption"] == null ? null : json["caption"],
        image: json["image"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        price: json["price"],
        subMenus: json["subMenus"] == null
            ? null
            : List<String>.from(json["subMenus"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "caption": caption == null ? null : caption,
        "image": image,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toMap())),
        "price": price,
        "subMenus": subMenus == null
            ? null
            : List<dynamic>.from(subMenus.map((x) => x)),
      };

  @override
  String toString() {
    return 'Item{name: $name, caption: $caption, image: $image, items: $items, price: $price, subMenus: $subMenus}';
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        this.name,
        this.caption,
        this.image,
        this.items,
        this.price,
        this.subMenus,
      ];
}
