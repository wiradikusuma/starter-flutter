import 'package:flutter/material.dart';

extension PaddedWidget on Widget {
  Widget padded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.all(value.toDouble()),
      );

  Widget hPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.symmetric(horizontal: value.toDouble()),
      );

  Widget vPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.symmetric(vertical: value.toDouble()),
      );

  Widget bPadded([final value = 16]) => Padding(
        child: this,
        padding: EdgeInsets.only(bottom: value.toDouble()),
      );
}
