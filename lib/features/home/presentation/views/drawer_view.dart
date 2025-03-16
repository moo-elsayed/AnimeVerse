import 'package:anime_universe/constants.dart';
import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            splashColor: KSecondaryColor,
            child: ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              trailing: Text(
                'Favorites',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
