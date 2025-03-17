import 'package:flutter/material.dart';

import '../../../../constants.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: KSecondaryColor,
      child: ListTile(
        leading: Icon(iconData, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
