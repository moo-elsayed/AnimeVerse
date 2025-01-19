import 'package:anime_universe/features/data/models/all_anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeItem extends StatelessWidget {
  const AnimeItem({super.key, required this.animeItem});

  final AllAnime animeItem;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                animeItem.title.substring(animeItem.animeName.length + 1),
                style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }
}
