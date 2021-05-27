import 'package:restaurant_menu/core/constants/image/image_constants.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {

  final double width;
  final double radius;
  final String image;
  final Color color;

  const CircleImage({Key key, this.width, this.image, this.radius, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(width ?? 40),
      height: context.dynamicWidth(width ?? 40),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
          borderRadius: BorderRadius.circular(context.dynamicWidth(radius ?? 50)),
          border: Border.all(color: color ?? Colors.grey),
          image: DecorationImage(
              image: AssetImage(image ?? ImageConstants.SPLASH_BACKGROUND)
          )
      ),
    );
  }
}
