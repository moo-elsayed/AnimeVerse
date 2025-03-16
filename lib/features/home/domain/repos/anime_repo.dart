import 'package:anime_universe/features/home/domain/entities/anime_entity.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/all_anime.dart';
import '../../data/models/search_anime.dart';



abstract class AnimeRepo {
  Future<Either<String, List<AllAnime>>> getAllAnime();

  Future<Either<String, List<AnimeEntity>>> searchAnime({required String animeName});

}
