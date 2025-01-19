import 'dart:developer';

import 'package:anime_universe/features/data/cubits/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/data/cubits/anime_cubit/anime_states.dart';
import 'package:anime_universe/features/data/models/all_anime.dart';
import 'package:anime_universe/features/presentation/views/home_view/widgets/all_anime_listView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeStates>(
      builder: (context, state) {
        if (state is GetAllAnimeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetAllAnimeFailure) {
          return Center(
            child: Text(state.errorMessage),
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
