import 'package:flutter/cupertino.dart';

extension ProjectContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double height) => this.height * height / 870;

  double dynamicWidth(double width) => this.width * width / 412;
}

extension EdgeInsetsExtension on BuildContext {
  EdgeInsetsGeometry get pagesEdgeInsets =>
      EdgeInsets.symmetric(horizontal: this.dynamicWidth(24));

  EdgeInsetsGeometry get menuItemEdgeInsets =>
      EdgeInsets.all(this.dynamicHeight(10));
}

extension SizedBoxExtension on BuildContext {
  SizedBox get lowSizedBoxHeight => SizedBox(
        height: this.dynamicHeight(25),
      );
}
