import 'package:flutter/material.dart';

class DetailsListItem extends StatelessWidget {
  const DetailsListItem(
      {super.key, required this.detailKey, required this.value});

  final String detailKey;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: TextStyle(
            color: detailKey == 'التصنيف' ? Colors.cyan : Colors.white,
            fontSize: 20,
          ),
        ),
        Text(
          detailKey,
          style: TextStyle(
            color: Colors.white60,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
