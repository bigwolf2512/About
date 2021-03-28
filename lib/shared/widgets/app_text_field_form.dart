import 'package:flutter/material.dart';

Widget createTextField({
  String? initialValue,
  FormFieldValidator<String>? validator,
  FormFieldSetter<String>? onSaved,
  ValueChanged<String>? onChanged,
  AutovalidateMode? autoValidateMode,
  String? hintText,
  int? maxLines,
  EdgeInsetsGeometry? contentPadding,
  FocusNode? focusNode,
  bool obscureText = false,
  TextInputType? keyboardType,
  TextInputAction? textInputAction,
  bool enabled = true,
}) {
  return TextFormField(
    initialValue: initialValue,
    enabled: enabled,
    focusNode: focusNode,
    autovalidateMode: autoValidateMode,
    validator: validator,
    onSaved: onSaved,
    onChanged: onChanged,
    maxLines: maxLines ?? 1,
    obscureText: obscureText,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      hintText: hintText,
      contentPadding: contentPadding ?? const EdgeInsets.all(14),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0XFF66AFE9),
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
      border: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color(0XFFCCCCCC),
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
    ),
  );
}
