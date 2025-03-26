import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

String extractNumber(String text) {
  RegExp regex = RegExp(r'\d+'); // يبحث عن أي أرقام في النص
  Match? match = regex.firstMatch(text);
  return match?.group(0) ?? ''; // يرجع الرقم إذا وجد، وإلا يرجع نص فارغ
}

showCustomSnackBar(
    {required BuildContext context,
    required String title,
    required String message,
    required ContentType contentType}) {
  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
