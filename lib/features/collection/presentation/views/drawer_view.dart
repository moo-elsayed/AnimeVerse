import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/collection/presentation/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'favorites_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/app_icon.jpg'),
              radius: 80,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),
            DrawerItem(
              title: 'Favorites',
              iconData: Icons.favorite,
              onTap: () {
                context.pushTransition(
                  type: PageTransitionType.leftToRight,
                  //duration: Duration(milliseconds: 230),
                  child: FavoritesView(),
                );
              },
            ),
            DrawerItem(
              onTap: () {},
              title: 'Watching now',
              iconData: Icons.play_circle,
            ),
          ],
        ),
      ),
    );
  }
}
