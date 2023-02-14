import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final bool appBar;

  final bool autofocus;

  final TextEditingController? controller;

  final bool dense;

  final bool disabled;

  final String? helperText;

  final Widget? icon;

  final String? initialValue;

  final List<TextInputFormatter> inputFormatters;

  final TextInputType keyboardType;

  final String? label;

  final int maxLength;

  final int minLines;

  final int maxLines;

  final bool obscureText;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onFieldSubmitted;

  final FormFieldSetter<String>? onSaved;

  final bool readOnly;

  final Widget? prefix;

  final Widget? prefixIcon;

  final String? prefixText;

  final Widget? suffixIcon;

  final String? suffixText;

  final TextAlign textAlign;

  final TextCapitalization textCapitalization;

  final TextInputAction? textInputAction;

  final FormFieldValidator<String>? validator;

  const Input({
    Key? key,
    this.appBar = false,
    this.autofocus = false,
    this.controller,
    this.dense = false,
    this.disabled = false,
    this.helperText,
    this.icon,
    this.initialValue,
    this.inputFormatters = const [],
    this.keyboardType = TextInputType.text,
    this.label,
    this.maxLength = 1000,
    this.minLines = 1,
    this.maxLines = 1,
    this.obscureText = false,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSaved,
    this.readOnly = false,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(ctx) => TextFormField(
        autofocus: autofocus,
        controller: controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          border: appBar
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                )
              : null,
          contentPadding: dense
              ? EdgeInsets.fromLTRB(12, appBar ? 3 : 9,
                  prefixIcon == null ? 12 : -16, appBar ? 2 : 10)
              : null,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          helperMaxLines: 3,
          helperText: helperText,
          hintText: dense ? label : null,
          icon: icon,
          isDense: dense,
          labelText: dense ? null : label,
          prefix: prefix,
          prefixIcon: prefixIcon,
          prefixText: prefixText,
          suffixIcon: suffixIcon,
          suffixText: suffixText,
        ),
        enabled: !disabled,
        initialValue: initialValue,
        inputFormatters: [
          ...inputFormatters,
          LengthLimitingTextInputFormatter(maxLength),
        ],
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved == null ? null : (s) => onSaved!(s?.trim()),
        readOnly: readOnly,
        textAlign: textAlign,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        validator: validator,
      );
}
