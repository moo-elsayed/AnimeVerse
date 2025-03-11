import 'dart:developer';
import 'package:anime_universe/core/utlis/anime_service.dart';
import 'package:anime_universe/core/utlis/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


import '../../data/models/all_anime.dart';
import '../../data/models/search_anime.dart';
import 'anime_repo.dart';

class AnimeRepoImp implements AnimeRepo {
  final AnimeService animeService = AnimeService();

  @override
  Future<Either<Failure, List<AllAnime>>> getAllAnime() async {
    try {
      List<AllAnime> allAnime = await animeService.getAllAnime();
      return right(allAnime);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }





  @override
  Future<Either<Failure, List<SearchAnime>>> searchAnime(
      {required String animeName}) async {
    try {
      List<SearchAnime> searchAnime =
          await animeService.searchAnime(animeName: animeName);
      return right(searchAnime);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
        return left(ServerFailure.fromDioException(e));
      } else {
        log(e.toString());
        return left(ServerFailure(errorMessage: e.toString()));
      }
    }
  }
}
