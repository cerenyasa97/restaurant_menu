import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ProjectText extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final FontWeight weight;
  final String family;
  final TextStyle style;
  final TextAlign align;
  final int maxLines;

  const ProjectText(
      {Key key,
      @required this.text,
      this.textSize,
      this.color,
      this.weight,
      this.family,
      this.style,
      this.align,
      this.maxLines,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _curScaleFactor = MediaQuery.of(context).textScaleFactor;
    return AutoSizeText(
      text,
      style: style ??
          TextStyle(
            color: color ?? Colors.black,
            fontSize: 16 * _curScaleFactor,
            fontWeight: weight ?? FontWeight.w400,
            fontFamily: family ?? "Roboto",
          ),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 5,
    );
  }
}