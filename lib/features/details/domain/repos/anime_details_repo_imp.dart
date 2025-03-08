import 'dart:developer';

import 'package:anime_universe/features/details/domain/repos/anime_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utlis/anime_service.dart';
import '../../../../core/utlis/failures.dart';
import '../../data/models/anime_content.dart';

class AnimeDetailsRepoImp implements AnimeDetailsRepo {
  final AnimeService animeService;

  AnimeDetailsRepoImp({required this.animeService});

  @override
  Future<Either<Failure, AnimeContent>> getAnimeContent(
      {required String animeId}) async {
    try {
      AnimeContent animeContent =
          await animeService.getAnimeContent(animeId: animeId);
      return right(animeContent);
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
