import 'package:flutter/material.dart';

import '../../constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.title,
  });

  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      iconAlignment: IconAlignment.end,
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 0),
        backgroundColor: KSecondaryColor,
        foregroundColor: Colors.white,
        //fixedSize: Size(147, 56),
        padding: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
