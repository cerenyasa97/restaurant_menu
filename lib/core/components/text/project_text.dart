import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return AutoSizeText(
      text,
      style: GoogleFonts.tinos(
            textStyle: TextStyle(
              color: color ?? Colors.black,
              fontSize: textSize,
            ),
        fontWeight: weight ?? FontWeight.normal
          ),
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines ?? 5,
    );
  }
}