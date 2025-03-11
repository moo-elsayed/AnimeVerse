import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.prefixIcon,
      required this.labelText,
      this.onChanged});

  final TextEditingController controller;
  final String hintText;
  final String labelText;
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
        // filled: true,
        // fillColor: KSecondaryColor,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon ?? null,
        border: getBorder(),
        enabledBorder: getBorder(),
        errorBorder: getBorder(color: Colors.red),
        focusedBorder: getBorder(),
      ),
    );
  }

  OutlineInputBorder getBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
