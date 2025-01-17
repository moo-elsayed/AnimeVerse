import 'dart:developer';

import 'package:anime_universe/features/data/cubits/anime_cubit/anime_states.dart';
import 'package:anime_universe/features/data/repos/anime_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit(this.animeRepo) : super(AnimeInitial());
  final AnimeRepo animeRepo;

  Future getAllAnime() async {
    emit(GetAllAnimeLoading());
    var result = await animeRepo.getAllAnime();
    result.fold(
        (failure) =>
            emit(GetAllAnimeFailure(errorMessage: failure.errorMessage)),
        (allAnimeList) => emit(GetAllAnimeSuccess(allAnimeList: allAnimeList)));
  }

  Future getAnimeContent({required String animeId}) async {
    emit(GetAnimeContentLoading());
    var result = await animeRepo.getAnimeContent(animeId: animeId);
    result.fold(
        (failure) =>
            emit(GetAnimeContentFailure(errorMessage: failure.errorMessage)),
        (animeContent) =>
            emit(GetAnimeContentSuccess(animeContent: animeContent)));
  }

  Future searchAnime({required String animeName}) async {
    emit(SearchAnimeLoading());
    var result = await animeRepo.searchAnime(animeName: animeName);
    result.fold(
        (failure) =>
            emit(SearchAnimeFailure(errorMessage: failure.errorMessage)),
        (searchedAnimeList) =>
            emit(SearchAnimeSuccess(searchedAnimeList: searchedAnimeList)));
  }

  Future getWatchServers({required String episodeUrl}) async {
    emit(GetWatchServersLoading());
    var result = await animeRepo.getWatchServers(episodeUrl: episodeUrl);
    result.fold(
        (failure) =>
            emit(GetWatchServersFailure(errorMessage: failure.errorMessage)),
        (watchServers) =>
            emit(GetWatchServersSuccess(watchServers: watchServers)));
  }
}
