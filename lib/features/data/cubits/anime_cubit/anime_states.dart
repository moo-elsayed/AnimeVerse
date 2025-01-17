import 'package:anime_universe/features/data/models/all_anime.dart';
import 'package:anime_universe/features/data/models/anime_content.dart';
import 'package:anime_universe/features/data/models/search_anime.dart';
import 'package:anime_universe/features/data/models/watch_servers.dart';

abstract class AnimeStates {}

class AnimeInitial extends AnimeStates {}

//-----------------------------------

class GetAllAnimeLoading extends AnimeStates {}

class GetAllAnimeSuccess extends AnimeStates {
  final List<AllAnime> allAnimeList;

  GetAllAnimeSuccess({required this.allAnimeList});
}

class GetAllAnimeFailure extends AnimeStates {
  final String errorMessage;

  GetAllAnimeFailure({required this.errorMessage});
}

//-----------------------------------

//-----------------------------------

class SearchAnimeLoading extends AnimeStates {}

class SearchAnimeSuccess extends AnimeStates {
  final List<SearchAnime> searchedAnimeList;

  SearchAnimeSuccess({required this.searchedAnimeList});
}

class SearchAnimeFailure extends AnimeStates {
  final String errorMessage;

  SearchAnimeFailure({required this.errorMessage});
}
//-----------------------------------

//-----------------------------------

class GetAnimeContentLoading extends AnimeStates {}

class GetAnimeContentSuccess extends AnimeStates {
  final AnimeContent animeContent;

  GetAnimeContentSuccess({required this.animeContent});
}

class GetAnimeContentFailure extends AnimeStates {
  final String errorMessage;

  GetAnimeContentFailure({required this.errorMessage});
}
//-----------------------------------

//-----------------------------------

class GetWatchServersLoading extends AnimeStates {}

class GetWatchServersSuccess extends AnimeStates {
  final WatchServers watchServers;

  GetWatchServersSuccess({required this.watchServers});
}

class GetWatchServersFailure extends AnimeStates {
  final String errorMessage;

  GetWatchServersFailure({required this.errorMessage});
}

//-----------------------------------
