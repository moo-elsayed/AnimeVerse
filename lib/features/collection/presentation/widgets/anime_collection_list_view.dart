import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/anime_model.dart';
import '../managers/collection_cubit/collection_cubit.dart';
import 'anime_collection_item.dart';

class AnimeCollectionListView extends StatelessWidget {
  const AnimeCollectionListView({super.key, required this.isFavorite});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    List<AnimeModel> favorites = context.read<CollectionCubit>().favoritesList;
    List<AnimeModel> watchingNow = context.read<CollectionCubit>().watchingList;
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: isFavorite == true ? favorites.length : watchingNow.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: MediaQuery.of(context).size.width * .02,
        childAspectRatio: 2.6 / 5,
        mainAxisSpacing: MediaQuery.of(context).size.width * .01,
      ),
      itemBuilder: (context, index) {
        return AnimeCollectionItem(
          animeModel:
              isFavorite == true ? favorites[index] : watchingNow[index],
        );
      },
    );
  }
}
