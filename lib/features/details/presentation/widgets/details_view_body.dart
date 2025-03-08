import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.animeContent});

  final AnimeContent animeContent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(animeContent.title,style: TextStyle(color: Colors.white),),
    );
  }
}
