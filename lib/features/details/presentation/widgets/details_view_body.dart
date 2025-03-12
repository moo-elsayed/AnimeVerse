import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:anime_universe/features/details/presentation/widgets/details_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.animeContent});

  final AnimeContent animeContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(animeContent.image),
          alignment: Alignment.topCenter,
          opacity: 0.1,
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
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
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: KSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: DetailsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
