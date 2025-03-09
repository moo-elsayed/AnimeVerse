import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: KSecondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        episode.episodeNumber,
        style: TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.right,
      ),
    );
  }
}
