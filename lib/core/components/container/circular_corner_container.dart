import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class CircularCornerContainer extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Widget child;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CircularCornerContainer(
      {Key key,
      @required this.child,
      this.width,
      this.height,
      this.radius,
      this.padding, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? context.menuItemEdgeInsets,
      width: width ?? 170,
      height: height ?? 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            context.dynamicWidth(radius ?? AppConstants.MENU_CORNER_RADIUS)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: child,
    );
  }
}
