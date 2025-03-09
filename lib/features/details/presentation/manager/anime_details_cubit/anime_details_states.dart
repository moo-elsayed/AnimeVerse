import '../../../data/models/anime_content.dart';
import '../../../data/models/watch_servers.dart';

abstract class AnimeDetailsStates {}

class AnimeDetailsInitial extends AnimeDetailsStates {}

//-----------------------------------

class GetAnimeContentLoading extends AnimeDetailsStates {}

class GetAnimeContentSuccess extends AnimeDetailsStates {
  final AnimeContent animeContent;

  GetAnimeContentSuccess({required this.animeContent});
}

class GetAnimeContentFailure extends AnimeDetailsStates {
  final String errorMessage;

  GetAnimeContentFailure({required this.errorMessage});
}

//-----------------------------------

//-----------------------------------

class GetWatchServersLoading extends AnimeDetailsStates {}

class GetWatchServersSuccess extends AnimeDetailsStates {
  final WatchServers watchServers;

  GetWatchServersSuccess({required this.watchServers});
}

class GetWatchServersFailure extends AnimeDetailsStates {
  final String errorMessage;

  GetWatchServersFailure({required this.errorMessage});
}

//-----------------------------------
