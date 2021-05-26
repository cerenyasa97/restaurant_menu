import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/components/image/project_image.dart';
import 'package:restaurant_menu/core/constants/image/image_constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.black87),
    );
  }
}
