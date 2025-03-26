import 'package:flutter/material.dart';

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.onChanged,
      required this.focusNode});

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      validator: (val) {
        if (val!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Colors.white54,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: prefixIcon ?? null,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: getBorder(color: Colors.red),
        focusedBorder: InputBorder.none,
      ),
    );
  }

  UnderlineInputBorder getBorder({Color? color}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
