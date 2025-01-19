import 'package:anime_universe/features/data/cubits/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/data/cubits/anime_cubit/anime_states.dart';
import 'package:anime_universe/features/presentation/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
      listener: (context, state) {
        if (state is GetAllAnimeSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
          );
        }
      },
      builder: (context, state) => SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/app_icon.jpg'),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
