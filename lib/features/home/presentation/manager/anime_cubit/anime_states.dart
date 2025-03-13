import '../../../data/models/all_anime.dart';
import '../../../data/models/search_anime.dart';

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


