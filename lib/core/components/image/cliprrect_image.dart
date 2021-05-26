import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/image/project_image.dart';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';

class ClipRRectImage extends StatelessWidget {
  final String imagePath;
  final double radius;

  const ClipRRectImage({Key key, @required this.imagePath, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(context.dynamicWidth(radius ?? 10)),
      child: ProjectImage(
        imagePath: imagePath,
      ),
    );
  }
}
