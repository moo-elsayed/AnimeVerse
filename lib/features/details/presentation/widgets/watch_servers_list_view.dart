import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list_item.dart';
import 'package:flutter/material.dart';

class WatchServersListView extends StatelessWidget {
  const WatchServersListView(
      {super.key, required this.link});



  final String link;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          4,
          (index) {
            return Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: index == 3 ? 10 : 0,
                right: 10,
                left: 10,
              ),
              child: WatchServersListItem(
                link: link,
                quality: qualityList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

List<String> qualityList = ['1080p', '720p', '480p', '360p'];
