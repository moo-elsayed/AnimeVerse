import '../../data/models/anime_model.dart';

abstract class CollectionRepo {
  Future<void> insertAnime({required AnimeModel anime, required String status});

  Future<void> removeFavoriteAnime({required String animeId});

  Future<List<AnimeModel>> getFavorites();

  Future<List<AnimeModel>> getWatching();

  Future<bool> isFavorite({required String animeId});

  Future<bool> isWatchingNow({required String animeId});

  Future<void> removeWatchingAnime({required String animeId});
}
