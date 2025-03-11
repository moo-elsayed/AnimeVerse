import 'package:anime_universe/features/details/presentation/widgets/watch_servers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/watch_servers_cubit/watch_servers_cubit.dart';
import '../manager/watch_servers_cubit/watch_servers_states.dart';

class WatchServersViewBody extends StatelessWidget {
  const WatchServersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchServersCubit, WatchServersStates>(
      builder: (context, state) {
        if (state is GetWatchServersSuccess) {
          String link = state.watchServers.servers
              .where(
                (element) => element.name.contains('megamax me'),
              )
              .toList()[0]
              .url;
          return WatchServersListView(
            link: link,
          );
        } else if (state is GetWatchServersFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
