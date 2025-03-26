import 'package:flutter/material.dart';

class firstTimeViewBody extends StatelessWidget {
  const firstTimeViewBody({
    super.key,
  });

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
            'You need to set the api key first',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
