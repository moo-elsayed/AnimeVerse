import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/all_anime.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import '../manager/anime_cubit/anime_states.dart';
import 'all_anime_listView.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeStates>(
      builder: (context, state) {
        if (state is GetAllAnimeLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (state is GetAllAnimeFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is GetAllAnimeSuccess) {
          List<AllAnime> allAnimeList = state.allAnimeList;
          return AllAnimeListview(allAnimeList: allAnimeList);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
