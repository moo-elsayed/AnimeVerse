import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/anime_model.dart';
import '../../../domain/repos/collection_repo.dart';
import 'collection_states.dart';

class CollectionCubit extends Cubit<CollectionStates> {
  CollectionCubit(this.collectionRepo) : super(FavoriteInitial());

  CollectionRepo collectionRepo;
  List<AnimeModel> favoritesList = [];
  List<AnimeModel> watchingList = [];

  //bool? isMyFavorite;

  Future<void> insertAnime(
      {required AnimeModel anime, required String status}) async {
    emit(InsertAnimeLoading());
    try {
      await collectionRepo.insertAnime(anime: anime, status: status);
      emit(InsertAnimeSuccess());
    } catch (e) {
      emit(InsertAnimeFailure(errorMessage: e.toString()));
    }
  }

  Future getFavorites() async {
    emit(GetFavoritesLoading());
    try {
      favoritesList = await collectionRepo.getFavorites();
      emit(GetFavoritesSuccess());
    } catch (e) {
      emit(GetFavoritesFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> isFavorite({required String animeId}) async {
    emit(IsFavoriteLoading());
    try {
      bool temp = await collectionRepo.isFavorite(animeId: animeId);
      log(temp.toString());
      emit(IsFavoriteSuccess());
      return temp;
    } catch (e) {
      emit(IsFavoriteFailure(errorMessage: e.toString()));
      return false;
    }
  }

  Future<void> removeFavoriteAnime({required String animeId}) async {
    emit(RemoveFavoriteLoading());
    try {
      await collectionRepo.removeFavoriteAnime(animeId: animeId);
      favoritesList.removeWhere(
        (element) => element.animeId == animeId,
      );
      emit(RemoveFavoriteSuccess());
    } catch (e) {
      emit(RemoveFavoriteFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> isWatchingNow({required String animeId}) async {
    emit(IsWatchingNowLoading());
    try {
      bool temp = await collectionRepo.isWatchingNow(animeId: animeId);
      log(temp.toString());
      emit(IsWatchingNowSuccess());
      return temp;
    } catch (e) {
      emit(IsWatchingNowFailure(errorMessage: e.toString()));
      return false;
    }
  }

  Future getWatching() async {
    emit(GetWatchingLoading());
    try {
      watchingList = await collectionRepo.getWatching();
      emit(GetWatchingSuccess());
    } catch (e) {
      emit(GetWatchingFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeWatchingAnime({required String animeId}) async {
    emit(RemoveWatchingLoading());
    try {
      await collectionRepo.removeWatchingAnime(animeId: animeId);
      watchingList.removeWhere(
        (element) => element.animeId == animeId,
      );
      emit(RemoveWatchingSuccess());
    } catch (e) {
      emit(RemoveWatchingFailure(errorMessage: e.toString()));
    }
  }
}
