import 'package:anime_universe/core/models/server.dart';
import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../manager/watch_servers_cubit/watch_servers_cubit.dart';
import '../manager/watch_servers_cubit/watch_servers_states.dart';

class WatchServersViewBody extends StatelessWidget {
  const WatchServersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchServersCubit, WatchServersStates>(
      builder: (context, state) {
        if (state is GetWatchServersSuccess) {
          String? link;
          for (Server server in state.watchServers.servers) {
            if (server.name.contains('megamax me')) {
              link = server.url;
              state.watchServers.servers.remove(server);
              break;
            }
          }

          return WatchServersListView(
            link: link,
            fromHome: false,
            servers: state.watchServers.servers,
          );
        } else if (state is GetWatchServersFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
