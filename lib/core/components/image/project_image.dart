import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final BoxFit fit;

  const ProjectImage({Key key, this.imagePath, this.height, this.width, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
