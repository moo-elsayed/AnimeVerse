import 'package:anime_universe/features/collection/presentation/widgets/drawer_list_view.dart';
import 'package:flutter/material.dart';

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
            Divider(
              height: MediaQuery.of(context).size.height * 0.08,
              endIndent: 20,
              indent: 20,
            ),
            DrawerListView(),
          ],
        ),
      ),
    );
  }
}
