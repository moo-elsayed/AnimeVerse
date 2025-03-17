import '../../data/data_sources/anime_local_data_source.dart';
import '../../data/models/anime_model.dart';
import 'collection_repo.dart';

class CollectionRepoImp implements CollectionRepo {
  final AnimeLocalDataSource animeLocalDataSource;

  CollectionRepoImp({required this.animeLocalDataSource});

  @override
  Future<void> insertAnime(
      {required AnimeModel anime, required String status}) async {
    await animeLocalDataSource.insertAnime(anime: anime, status: status);
  }

  @override
  Future<List<AnimeModel>> getFavorites() async {
    return await animeLocalDataSource.getFavorites();
  }

  @override
  Future<List<AnimeModel>> getWatching() async {
    return await animeLocalDataSource.getWatching();
  }

  @override
  Future<bool> isFavorite({required String animeId}) async {
    return await animeLocalDataSource.isFavorite(animeId: animeId);
  }

  @override
  Future<void> removeFavoriteAnime({required String animeId}) async {
    await animeLocalDataSource.removeFavoriteAnime(animeId: animeId);
  }

  @override
  Future<bool> isWatchingNow({required String animeId}) async {
    return await animeLocalDataSource.isWatchingNow(animeId: animeId);
  }

  @override
  Future<void> removeWatchingAnime({required String animeId}) async {
    await animeLocalDataSource.removeWatchingAnime(animeId: animeId);
  }
}
