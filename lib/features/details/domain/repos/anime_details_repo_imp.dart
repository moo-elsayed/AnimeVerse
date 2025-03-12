import 'dart:developer';

import 'package:anime_universe/features/details/domain/repos/anime_details_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utlis/anime_service.dart';
import '../../data/models/anime_content.dart';
import '../../data/models/watch_servers.dart';

class AnimeDetailsRepoImp implements AnimeDetailsRepo {
  final AnimeService animeService;

  AnimeDetailsRepoImp({required this.animeService});

  @override
  Future<Either<String, AnimeContent>> getAnimeContent(
      {required String animeId}) async {
    try {
      AnimeContent animeContent =
          await animeService.getAnimeContent(animeId: animeId);
      return right(animeContent);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;

          // التأكد إن البيانات عبارة عن Map<String, dynamic>
          if (errorData is Map<String, dynamic>) {
            String errorMessage = '';

            if (errorData.containsKey('error')) {
              errorMessage += "${errorData['error']}\n";
            }
            if (errorData.containsKey('message')) {
              errorMessage += "${errorData['message']}";
            }

            return left(errorMessage.trim());
          }

          // لو البيانات String فقط، رجعها كما هي
          if (errorData is String) {
            return left(errorData);
          }
        }
      }

      log(e.toString());
      return left("حدث خطأ غير متوقع");
    }
  }

  @override
  Future<Either<String, WatchServers>> getWatchServers(
      {required String episodeUrl}) async {
    try {
      WatchServers watchServers =
          await animeService.getWatchServes(episodeUrl: episodeUrl);
      return right(watchServers);
    } catch (e) {
      if (e is DioException) {
        if (e.response != null && e.response!.data != null) {
          var errorData = e.response!.data;

          // التأكد إن البيانات عبارة عن Map<String, dynamic>
          if (errorData is Map<String, dynamic>) {
            String errorMessage = '';

            if (errorData.containsKey('error')) {
              errorMessage += "${errorData['error']}\n";
            }
            if (errorData.containsKey('message')) {
              errorMessage += "${errorData['message']}";
            }

            return left(errorMessage.trim());
          }

          // لو البيانات String فقط، رجعها كما هي
          if (errorData is String) {
            return left(errorData);
          }
        }
      }

      log(e.toString());
      return left("حدث خطأ غير متوقع");
    }
  }
}
