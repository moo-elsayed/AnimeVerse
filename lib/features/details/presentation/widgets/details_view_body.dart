import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.animeContent});

  final AnimeContent animeContent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: animeContent.image,
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            Text(
              animeContent.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              animeContent.season,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              animeContent.status,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              '${animeContent.genre} النوع',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            Text(
              animeContent.episodeDuration,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
