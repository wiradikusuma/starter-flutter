import 'package:app/widget/support/one_line.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String _text;

  final VoidCallback? _onPressed;

  final bool dense;

  const Button(
    this._text,
    this._onPressed, {
    Key? key,
    this.dense = false,
  }) : super(key: key);

  @override
  Widget build(ctx) => SizedBox(
        child: ElevatedButton(
          child: OneLine(_text),
          onPressed: _onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        width: double.infinity,
        height: dense ? 32 : 56,
      );
}
