import 'package:flutter/material.dart';

import '../../../../constants.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.keyboardType,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;

  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      style: TextStyle(color: Colors.white),
      validator: (val) {
        if (val!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Colors.white54,
      decoration: InputDecoration(
        filled: true,
        fillColor: KSecondaryColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: widget.prefixIcon ?? null,
        border: getBorder(),
        enabledBorder: getBorder(),
        errorBorder: getBorder(color: Colors.red),
        focusedBorder: getBorder(color: KMainColor),
      ),
    );
  }

  OutlineInputBorder getBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? KSecondaryColor),
    );
  }
}
