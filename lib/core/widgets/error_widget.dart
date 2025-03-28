import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: SizedBox(
              width: 170,
              child: Image.asset(
                'assets/sad.gif',
              ),
            ),
          ),
          Text(
            errorMessage,
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
