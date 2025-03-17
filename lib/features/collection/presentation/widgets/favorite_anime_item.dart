import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../details/presentation/views/anime_view.dart';
import '../../data/models/anime_model.dart';
import '../managers/collection_cubit/collection_cubit.dart';

class FavoriteAnimeItem extends StatelessWidget {
  const FavoriteAnimeItem({super.key, required this.animeModel});

  final AnimeModel animeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          child: AnimeView(
            image: animeModel.image,
            episodes: animeModel.episodes,
            animeId: animeModel.animeId,
            title: animeModel.title,
            isFavorite: await context
                .read<CollectionCubit>()
                .isFavorite(animeId: animeModel.animeId),
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
                    imageUrl: animeModel.image,
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
                  "Episodes ${animeModel.episodes}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              animeModel.title,
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
