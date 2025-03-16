import 'package:anime_universe/features/favorites/data/models/anime_model.dart';
import 'package:anime_universe/features/favorites/presentation/managers/favorite_cubit/favorite_cubit.dart';
import 'package:anime_universe/features/favorites/presentation/widgets/favorite_anime_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesAnimeListView extends StatelessWidget {
  const FavoritesAnimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AnimeModel> favorites = context.read<FavoriteCubit>().favoritesList;
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: favorites.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: MediaQuery.of(context).size.width * .02,
        childAspectRatio: 2.6 / 5,
        mainAxisSpacing: MediaQuery.of(context).size.width * .01,
      ),
      itemBuilder: (context, index) {
        return FavoriteAnimeItem(animeModel: favorites[index]);
      },
    );
  }
}
