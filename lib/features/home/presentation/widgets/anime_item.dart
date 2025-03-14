import 'package:anime_universe/features/details/presentation/views/anime_view.dart';
import 'package:anime_universe/features/details/presentation/views/watch_servers_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../data/models/all_anime.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem({super.key, required this.animeItem});

  final AllAnime animeItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          child: AnimeView(
            animeId:
                animeItem.animeUrl.substring(29, animeItem.animeUrl.length - 1),
            title: animeItem.animeName,
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
                    imageUrl: animeItem.image,
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pushTransition(
                    type: PageTransitionType.leftToRight,
                    //duration: Duration(milliseconds: 230),
                    child: WatchServersView(
                      episodeNumber: animeItem.episodes[0].episodeNumber,
                      link: animeItem.episodes[0].servers
                          .where(
                              (element) => element.name.contains('megamax me'))
                          .toList()[0]
                          .url,
                    ),
                  );
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 2),
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    animeItem.title.substring(animeItem.animeName.length + 1),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              animeItem.animeName,
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
