import 'package:flutter/cupertino.dart';

extension ProjectContextExtension on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  double dynamicHeight(double height) => this.height * height/870;
  double dynamicWidth(double width) => this.width * width/412;

}