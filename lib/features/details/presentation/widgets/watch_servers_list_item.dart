import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../video_player_screen.dart';

class WatchServersListItem extends StatelessWidget {
  const WatchServersListItem(
      {super.key, required this.quality, required this.link});

  final String quality;
  final String link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              videoUrl: link,
            ),
          ),
        );

        // context.pushTransition(
        //   type: PageTransitionType.leftToRight,
        //   duration: Duration(milliseconds: 300),
        //   child: VideoPlayerScreen(
        //     videoUrl: link,
        //   ),
        // );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: KSecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'megamax me',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.right,
            ),
            Text(
              quality,
              style: TextStyle(
                color: quality == '1080p'
                    ? Colors.cyan
                    : quality == '720p'
                        ? Colors.greenAccent
                        : quality == '480p'
                            ? Colors.orangeAccent
                            : Colors.redAccent,
                fontSize: 18,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
