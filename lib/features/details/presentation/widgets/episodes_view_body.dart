import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:anime_universe/features/details/presentation/widgets/episode_item.dart';
import 'package:flutter/material.dart';

class EpisodesViewBody extends StatelessWidget {
  const EpisodesViewBody({super.key, required this.episodes});

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: index == episodes.length - 1 ? 10 : 0,
            right: 10,
            left: 10,
          ),
          child: EpisodeItem(
            episode: episodes[index],
          ),
        );
      },
    );
  }
}
