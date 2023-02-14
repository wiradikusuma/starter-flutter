import 'package:flutter/material.dart';

class OneLine extends Text {
  const OneLine(
    String text, {
    Key? key,
    int maxLines = 1,
    TextStyle? style,
  }) : super(
          text,
          key: key,
          maxLines: maxLines,
          overflow: TextOverflow.fade,
          softWrap: maxLines != 1,
          style: style,
        );
}
