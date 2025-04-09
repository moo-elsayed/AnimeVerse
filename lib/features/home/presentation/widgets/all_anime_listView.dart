import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../data/models/all_anime.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import 'anime_item.dart';

class AllAnimeGridView extends StatelessWidget {
  const AllAnimeGridView({super.key, required this.allAnimeList});

  final List<AllAnime> allAnimeList;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<AnimeCubit>(context).getAllAnime();
      },
      child: AnimationLimiter(
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
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: AnimeItem(
                    animeItem: allAnimeList[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
