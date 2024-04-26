import 'package:flutter/material.dart';

Widget getTextField(context,
    {String? hintText,
    Widget? suffixIcon,
    bool? obscureText,
    Widget? prefixIcon,
    TextEditingController? controller,
    Function(String)? onChanged,
    }) {
  return TextField(

    controller: controller,
    obscureText: obscureText ?? false,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      hintText: hintText,
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 0.7, color: Colors.red),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 0.5, color: Colors.grey),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1.0, color: Colors.grey),
      ),
      hintStyle: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: Colors.grey),
      suffixIcon: suffixIcon,
    ),
    onChanged: onChanged,
  );
}
