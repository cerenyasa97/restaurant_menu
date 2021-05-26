import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_menu/notifier/menu_notifier.dart';
import 'package:restaurant_menu/screens/splash/splash_screen.dart';

void main() => runApp(
    ChangeNotifierProvider<MenuProvider>(
      create: (_) => MenuProvider(),
      child: MyApp(),
    )

);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
