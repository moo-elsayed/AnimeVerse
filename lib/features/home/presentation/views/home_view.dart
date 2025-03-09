import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        title: Text(
          'AnimeVerse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //centerTitle: true,
        backgroundColor: KSecondaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
