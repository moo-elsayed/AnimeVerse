import 'package:anime_universe/features/presentation/views/splash_view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Constants.mainColor,
      body: SplashViewBody(),
    );
  }
}
