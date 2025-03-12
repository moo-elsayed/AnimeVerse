import 'package:anime_universe/features/details/presentation/manager/watch_servers_cubit/watch_servers_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/anime_details_repo.dart';

class WatchServersCubit extends Cubit<WatchServersStates> {
  WatchServersCubit(this.animeRepo) : super(WatchServersInitial());
  final AnimeDetailsRepo animeRepo;

  String? episodeURL;

  Future getWatchServers({required String episodeUrl}) async {
    if (episodeURL != null && episodeURL == episodeUrl) {
      return;
    }
    episodeURL = episodeUrl;

    emit(GetWatchServersLoading());
    var result = await animeRepo.getWatchServers(episodeUrl: episodeUrl);
    result.fold(
        (failure) =>
            emit(GetWatchServersFailure(errorMessage: failure)),
        (watchServers) =>
            emit(GetWatchServersSuccess(watchServers: watchServers)));
  }
}
