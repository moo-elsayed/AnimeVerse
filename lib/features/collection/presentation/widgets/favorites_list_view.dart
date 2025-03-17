
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/anime_model.dart';
import '../managers/collection_cubit/collection_cubit.dart';
import 'favorite_anime_item.dart';

class FavoritesAnimeListView extends StatelessWidget {
  const FavoritesAnimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AnimeModel> favorites = context.read<CollectionCubit>().favoritesList;
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
