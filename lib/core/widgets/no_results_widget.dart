import 'package:flutter/material.dart';

class NoResultsWidget extends StatelessWidget {
  const NoResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: SizedBox(
              height: 150,
              width: 150,
              child: Image.asset(
                "assets/llorando.gif",
              ),
            ),
          ),
          Text(
            'No results',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
