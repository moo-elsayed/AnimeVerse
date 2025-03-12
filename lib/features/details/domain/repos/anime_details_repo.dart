import 'package:dartz/dartz.dart';

import '../../data/models/anime_content.dart';
import '../../data/models/watch_servers.dart';

abstract class AnimeDetailsRepo{
  Future<Either<String, AnimeContent>> getAnimeContent(
      {required String animeId});

  Future<Either<String, WatchServers>> getWatchServers(
      {required String episodeUrl});
}