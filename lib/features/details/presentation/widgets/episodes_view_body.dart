import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:flutter/material.dart';

class EpisodesViewBody extends StatelessWidget {
  const EpisodesViewBody({super.key, required this.episodes});

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(
            top: 10,
            bottom: index == episodes.length - 1 ? 10 : 0,
            right: 10,
            left: 10,
          ),
          decoration: ShapeDecoration(
            color: KSecondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                8,
              ),
            ),
          ),
          child: Text(
            episodes[index].episodeNumber,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18
            ),
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}
