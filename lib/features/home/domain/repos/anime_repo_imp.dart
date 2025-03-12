import 'dart:developer';
import 'package:anime_universe/core/utlis/anime_service.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../data/models/all_anime.dart';
import '../../data/models/search_anime.dart';
import 'anime_repo.dart';

class AnimeRepoImp implements AnimeRepo {
  final AnimeService animeService = AnimeService();

  @override
  Future<Either<String, List<AllAnime>>> getAllAnime() async {
    try {
      List<AllAnime> allAnime = await animeService.getAllAnime();
      return right(allAnime);
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
  Future<Either<String, List<SearchAnime>>> searchAnime(
      {required String animeName}) async {
    try {
      List<SearchAnime> searchAnime =
          await animeService.searchAnime(animeName: animeName);
      return right(searchAnime);
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
