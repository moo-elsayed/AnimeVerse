import '../../data/models/anime_model.dart';

abstract class FavoriteRepo {
  Future<void> addFavorite({required AnimeModel anime});

  Future<void> removeFavorite({required String animeId});

  Future<List<AnimeModel>> getFavorites();

  Future<bool> isFavorite({required String animeId});
}
