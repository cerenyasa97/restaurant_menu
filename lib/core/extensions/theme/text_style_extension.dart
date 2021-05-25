import 'package:flutter/material.dart';

extension TextStyleExtension on ThemeData{
  TextStyle get headline1Black => this.textTheme.headline1;
  TextStyle get headline1White => this.textTheme.headline1.copyWith(color: Colors.white);
  TextStyle get headline2Black => this.textTheme.headline2;
  TextStyle get headline2White => this.textTheme.headline2.copyWith(color: Colors.white);
  TextStyle get headline3Black => this.textTheme.headline3;
  TextStyle get headline3White => this.textTheme.headline4.copyWith(color: Colors.white);
}