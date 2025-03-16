import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/details/presentation/manager/watch_servers_cubit/watch_servers_cubit.dart';
import 'package:anime_universe/features/details/presentation/widgets/watch_servers_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/server.dart';
import '../widgets/watch_servers_list.dart';
import '../widgets/watch_servers_list_view.dart';

class WatchServersView extends StatefulWidget {
  const WatchServersView(
      {super.key,
      this.episodeUrl,
      required this.episodeNumber,
      this.link,
      this.servers});

  final String? episodeUrl;
  final String episodeNumber;
  final List<Server>? servers;
  final String? link;

  @override
  State<WatchServersView> createState() => _WatchServersViewState();
}

class _WatchServersViewState extends State<WatchServersView> {
  @override
  void initState() {
    if (widget.episodeUrl != null) {
      BlocProvider.of<WatchServersCubit>(context)
          .getWatchServers(episodeUrl: widget.episodeUrl!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.episodeNumber,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: KSecondaryColor,
      ),
      body: widget.episodeUrl == null
          ? WatchServersListView(
              servers: widget.servers!,
              fromHome: true,
              link: widget.link,
            )
          : WatchServersViewBody(),
    );
  }
}
