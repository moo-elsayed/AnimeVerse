import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:anime_universe/features/details/presentation/manager/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_universe/features/details/presentation/widgets/episode_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesViewBody extends StatelessWidget {
  const EpisodesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Episode> episodes =
        BlocProvider.of<AnimeDetailsCubit>(context).episodes;
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
