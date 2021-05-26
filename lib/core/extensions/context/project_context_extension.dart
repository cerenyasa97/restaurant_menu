import 'package:flutter/cupertino.dart';

extension ProjectContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double height) => this.height * height / 870;

  double dynamicWidth(double width) => this.width * width / 412;
}

extension EdgeInsetsExtension on BuildContext {
  EdgeInsetsGeometry get pagesEdgeInsets => EdgeInsets.only(
      left: this.dynamicWidth(24),
      right: this.dynamicWidth(24),
      bottom: this.dynamicHeight(24));

  EdgeInsetsGeometry get menuItemEdgeInsets =>
      EdgeInsets.all(this.dynamicHeight(10));

  EdgeInsetsGeometry get selectFoodsEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(20));

  EdgeInsetsGeometry get lowEdgeInsets =>
      EdgeInsets.all(this.dynamicHeight(5));
}

extension SizedBoxExtension on BuildContext {
  SizedBox get lowSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(5),
  );

  SizedBox get mediumSizedBoxHeight => SizedBox(
    height: this.dynamicHeight(15),
  );

  SizedBox get largeSizedBoxHeight => SizedBox(
        height: this.dynamicHeight(25),
      );
}
