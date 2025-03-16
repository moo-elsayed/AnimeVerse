import 'dart:developer';

import 'package:anime_universe/features/favorites/presentation/managers/favorite_cubit/favorite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/anime_model.dart';
import '../../../domain/repos/favorite_repo.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(this.favoriteRepo) : super(FavoriteInitial());

  FavoriteRepo favoriteRepo;
  List<AnimeModel> favoritesList = [];

  //bool? isMyFavorite;

  Future<void> addFavorite({required AnimeModel anime}) async {
    emit(AddFavoriteLoading());
    try {
      await favoriteRepo.addFavorite(anime: anime);
      emit(AddFavoriteSuccess());
    } catch (e) {
      emit(AddFavoriteFailure(errorMessage: e.toString()));
    }
  }

  Future getFavorites() async {
    emit(GetFavoritesLoading());
    try {
      favoritesList = await favoriteRepo.getFavorites();
      emit(GetFavoritesSuccess());
    } catch (e) {
      emit(GetFavoritesFailure(errorMessage: e.toString()));
    }
  }

  Future<bool> isFavorite({required String animeId}) async {
    emit(IsFavoriteLoading());
    try {
      emit(IsFavoriteSuccess());
      bool j = await favoriteRepo.isFavorite(animeId: animeId);
      log(j.toString());
      return j;
    } catch (e) {
      emit(IsFavoriteFailure(errorMessage: e.toString()));
      return false;
    }
  }

  Future<void> removeFavorite({required String animeId}) async {
    emit(RemoveFavoriteLoading());
    try {
      await favoriteRepo.removeFavorite(animeId: animeId);
      favoritesList.removeWhere(
        (element) => element.animeId == animeId,
      );
      emit(RemoveFavoriteSuccess());
    } catch (e) {
      emit(RemoveFavoriteFailure(errorMessage: e.toString()));
    }
  }
}
