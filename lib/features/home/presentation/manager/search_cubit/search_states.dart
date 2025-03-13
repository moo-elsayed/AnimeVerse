import '../../../data/models/search_anime.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

//-----------------------------------

class SearchAnimeLoading extends SearchStates {}

class SearchAnimeSuccess extends SearchStates {
  final List<SearchAnime> searchedAnimeList;

  SearchAnimeSuccess({required this.searchedAnimeList});
}

class SearchAnimeFailure extends SearchStates {
  final String errorMessage;

  SearchAnimeFailure({required this.errorMessage});
}
//-----------------------------------
