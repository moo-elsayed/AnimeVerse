import 'dart:developer';

import 'package:anime_universe/features/data/cubits/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/data/cubits/anime_cubit/anime_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnimeCubit, AnimeStates>(
      listener: (context, state) {
        if (state is GetAllAnimeSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('GetAllAnimeSuccess')));
        } else if (state is SearchAnimeSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('SearchAnimeSuccess')));
        } else if (state is GetAnimeContentSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('GetAnimeContentSuccess')));
        } else if (state is GetWatchServersSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('GetWatchServersSuccess')));
        }
      },
      builder: (context, state) => SizedBox(
        width: double.infinity,
        child: Column(
          spacing: 30,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<AnimeCubit>(context).getAllAnime();
              },
              child: Text('test get all anime'),
            ),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<AnimeCubit>(context)
                    .searchAnime(animeName: 'death note');
              },
              child: Text('test search anime'),
            ),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<AnimeCubit>(context)
                    .getAnimeContent(animeId: 'death-note');
              },
              child: Text('test get anime content'),
            ),
            OutlinedButton(
              onPressed: () {
                BlocProvider.of<AnimeCubit>(context).getWatchServers(
                    episodeUrl:
                        'death-note-14-%D8%A7%D9%84%D8%AD%D9%84%D9%82%D8%A9');
              },
              child: Text('test get watch servers'),
            ),
          ],
        ),
      ),
    );
  }
}
