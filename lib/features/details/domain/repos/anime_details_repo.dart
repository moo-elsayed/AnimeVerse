import 'package:dartz/dartz.dart';

import '../../../../core/utlis/failures.dart';
import '../../data/models/anime_content.dart';
import '../../data/models/watch_servers.dart';

abstract class AnimeDetailsRepo{
  Future<Either<Failure, AnimeContent>> getAnimeContent(
      {required String animeId});

  Future<Either<Failure, WatchServers>> getWatchServers(
      {required String episodeUrl});
}