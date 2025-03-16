import 'package:anime_universe/features/favorites/data/models/anime_model.dart';

import '../../data/data_sources/anime_local_data_source.dart';
import 'favorite_repo.dart';

class favoriteRepoImp implements favoriteRepo {
  final AnimeLocalDataSource animeLocalDataSource;

  favoriteRepoImp({required this.animeLocalDataSource});

  @override
  Future<void> addFavorite({required AnimeModel anime}) async {
    await animeLocalDataSource.insertAnime(anime: anime);
  }

  @override
  Future<List<AnimeModel>> getFavorites() async {
    return await animeLocalDataSource.getAllFavorites();
  }

  @override
  Future<bool> isFavorite({required String animeId}) async {
    return await animeLocalDataSource.isFavorite(animeId: animeId);
  }

  @override
  Future<void> removeFavorite({required String animeId}) async {
    await animeLocalDataSource.deleteAnime(animeId: animeId);
  }
}
