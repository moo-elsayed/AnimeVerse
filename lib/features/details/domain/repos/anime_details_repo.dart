import 'package:dartz/dartz.dart';

import '../../../../core/utlis/failures.dart';
import '../../data/models/anime_content.dart';

abstract class AnimeDetailsRepo{
  Future<Either<Failure, AnimeContent>> getAnimeContent(
      {required String animeId});
}