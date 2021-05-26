import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final TextStyle bigStyle;
  final TextStyle smallStyle;

  const CustomRichText({Key key, this.text, this.bigStyle, this.smallStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> textList = text.split(" ");
    final TextTheme textTheme = Theme.of(context).textTheme;

    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: textList
                .map((item) => TextSpan(
                    text: item +
                        (textList.length == 2 && item == textList[0]
                            ? "\n"
                            : " "),
                    style: textList.last != item || textList.length == 1
                        ? (bigStyle ??
                            textTheme.headline5
                                .copyWith(fontWeight: FontWeight.w600))
                        : (smallStyle ??
                            textTheme.headline6
                                .copyWith(fontWeight: FontWeight.w400))))
                .toList()));
  }
}
