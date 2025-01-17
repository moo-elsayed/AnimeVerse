import 'package:anime_universe/core/utlis/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/all_anime.dart';
import '../models/anime_content.dart';
import '../models/search_anime.dart';

import '../models/watch_servers.dart';

abstract class AnimeRepo {
  Future<Either<Failure, List<AllAnime>>> getAllAnime();

  Future<Either<Failure, List<SearchAnime>>> searchAnime({required String animeName});

  Future<Either<Failure, AnimeContent>> getAnimeContent(
      {required String animeId});

  Future<Either<Failure, WatchServers>> getWatchServers(
      {required String episodeUrl});
}
