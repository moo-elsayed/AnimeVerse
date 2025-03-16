import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/models/server.dart';
import '../../../../video_player_screen.dart';

class WatchServersListItem extends StatelessWidget {
  const WatchServersListItem(
      {super.key, required this.server, required this.fromHome});

  final Server server;
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(
              videoUrl: server.url,
            ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fromHome == true
                  ? server.quality == 'FHD'
                      ? server.name.substring(3)
                      : server.name.substring(2)
                  : server.name,
              style: TextStyle(color: Colors.white, fontSize: 18),
              //textAlign: TextAlign.right,
            ),
            server.name == 'megamax me'
                ? Row(
                    spacing: 8,
                    children: [
                      Text(
                        'FHD',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'HD',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'SD',
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )
                : Text(
                    server.quality,
                    style: TextStyle(
                      color: server.quality == 'FHD'
                          ? Colors.cyan
                          : server.quality == 'HD'
                              ? Colors.greenAccent
                              : server.quality == 'SD'
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
