import 'dart:async';
import 'package:restaurant_menu/core/extensions/context/project_context_extension.dart';
import 'package:restaurant_menu/core/components/text/project_text.dart';
import 'package:restaurant_menu/core/constants/app/app_constants.dart';
import 'package:restaurant_menu/core/constants/text/text_constants.dart';
import 'package:restaurant_menu/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_menu/core/constants/enums/pages/pages.dart';
import 'package:restaurant_menu/core/components/image/project_image.dart';
import 'package:restaurant_menu/core/constants/image/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProjectImage(
            imagePath: ImageConstants.SPLASH_BACKGROUND,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              direction: Axis.vertical,
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: ProjectText(
                    text: TextConstants.SPLASH_TITLE,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.white, fontSize: 85),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _startTimer() {
    Timer(
        Duration(seconds: AppConstants.SPLASH_SHOWTIME),
        () => NavigationService.instance
            .navigatorPushReplacement(context, Pages.MAIN_MENU));
  }
}
