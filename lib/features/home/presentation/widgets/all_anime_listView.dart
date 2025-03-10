
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/all_anime.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import 'anime_item.dart';

class AllAnimeListview extends StatelessWidget {
  const AllAnimeListview({super.key, required this.allAnimeList});

  final List<AllAnime> allAnimeList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<AnimeCubit>(context).getAllAnime();
      },
      child: GridView.builder(
        padding: EdgeInsets.all(5),
        itemCount: allAnimeList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: MediaQuery.of(context).size.width * .02,
          childAspectRatio: 2.6 / 5,
          mainAxisSpacing: MediaQuery.of(context).size.width * .01,
        ),
        itemBuilder: (context, index) {
          return AnimeItem(animeItem: allAnimeList[index]);
        },
      ),
    );
  }
}
