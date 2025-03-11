import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:anime_universe/features/details/presentation/views/watch_servers_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({super.key, required this.episode});

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          //duration: Duration(milliseconds: 230),
          child: WatchServersView(
            episodeNumber: episode.episodeNumber,
            episodeUrl: episode.episodeUrl,
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}
