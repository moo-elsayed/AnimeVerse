import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      this.onChanged});

  final TextEditingController controller;
  final String hintText;

  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: (val) {
        if (val!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
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
