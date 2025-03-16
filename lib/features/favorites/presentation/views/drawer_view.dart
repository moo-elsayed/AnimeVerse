import 'package:anime_universe/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'favorites_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.pushTransition(
                type: PageTransitionType.leftToRight,
                //duration: Duration(milliseconds: 230),
                child: FavoritesView(),
              );
            },
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
