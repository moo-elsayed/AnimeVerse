import 'package:anime_universe/features/home/data/models/search_anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../core/utlis/functions.dart';
import '../../../collection/presentation/managers/collection_cubit/collection_cubit.dart';
import '../../../details/presentation/views/anime_view.dart';

class SearchAnimeItem extends StatelessWidget {
  const SearchAnimeItem({super.key, required this.searchAnime});

  final SearchAnime searchAnime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          child: AnimeView(
            image: searchAnime.image,
            episodes: extractNumber(searchAnime.episodes),
            animeId: searchAnime.animeId,
            title: searchAnime.title,
            isFavorite: await context
                .read<CollectionCubit>()
                .isFavorite(animeId: searchAnime.animeId),
            isWatchingNow: await context
                .read<CollectionCubit>()
                .isWatchingNow(animeId: searchAnime.animeId),
          ),
        );
      },
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.23,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: searchAnime.image,
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white54,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                margin: EdgeInsets.only(left: 2),
                padding: const EdgeInsets.all(2),
                child: Text(
                  searchAnime.episodes.replaceAll('عدد الحلقات', 'Episodes'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              searchAnime.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
