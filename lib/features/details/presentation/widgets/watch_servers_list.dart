import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/server.dart';

class WatchServersList extends StatelessWidget {
  const WatchServersList({super.key, this.servers, required this.fromHome});

  final List<Server>? servers;
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        servers!.length,
        (index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 10,
              bottom: index == servers!.length - 1 ? 10 : 0,
            ),
            child: WatchServersListItem(
              fromHome: fromHome,
              server: servers![index],
            ),
          );
        },
      ),
    );
  }
}
