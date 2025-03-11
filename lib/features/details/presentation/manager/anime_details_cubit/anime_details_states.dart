import '../../../data/models/anime_content.dart';

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
