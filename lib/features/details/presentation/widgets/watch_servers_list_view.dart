import 'package:anime_universe/core/models/server.dart';
import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list.dart';
import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list_item.dart';
import 'package:flutter/material.dart';

class WatchServersListView extends StatelessWidget {
  const WatchServersListView(
      {super.key, required this.servers, this.link, required this.fromHome});

  final List<Server> servers;
  final String? link;
  final bool fromHome;

  @override
  Widget build(BuildContext context) {
    List<Server> FHDServers = servers
        .where((server) =>
            server.quality == 'FHD' && !server.name.contains('megamax me'))
        .toList();
    List<Server> HDServers = servers
        .where((server) =>
            server.quality == 'HD' && !server.name.contains('megamax me'))
        .toList();
    List<Server> SDServers = servers
        .where((server) =>
            server.quality == 'SD' && !server.name.contains('megamax me'))
        .toList();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            FHDServers.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        'FHD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      WatchServersList(
                        fromHome: fromHome,
                        servers: FHDServers,
                      ),
                    ],
                  )
                : SizedBox(height: 0),
            HDServers.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        'HD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      WatchServersList(
                        fromHome: fromHome,
                        servers: HDServers,
                      ),
                    ],
                  )
                : SizedBox(height: 0),
            SDServers.isNotEmpty
                ? Column(
                    children: [
                      Text(
                        'SD',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      WatchServersList(
                        fromHome: fromHome,
                        servers: SDServers,
                      ),
                    ],
                  )
                : SizedBox(height: 0),
            link != null
                ? Column(
                    spacing: 10,
                    children: [
                      Text(
                        'سيرفر احتياطي',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      WatchServersListItem(
                        server:
                            Server(quality: '', name: 'megamax me', url: link!),
                        fromHome: false,
                      ),
                    ],
                  )
                : SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
