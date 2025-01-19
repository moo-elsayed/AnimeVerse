import 'package:anime_universe/features/presentation/views/home_view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.mainColor,
      appBar: AppBar(
        title: Text(
          'AnimeVerse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff262E39),
      ),
      body: HomeViewBody(),
    );
  }
}
