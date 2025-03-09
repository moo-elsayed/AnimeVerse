import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/anime_repo.dart';
import 'anime_states.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit(this.animeRepo) : super(AnimeInitial());
  final AnimeRepo animeRepo;

  Future getAllAnime() async {
    emit(GetAllAnimeLoading());
    var result = await animeRepo.getAllAnime();
    result.fold(
        (failure) =>
            emit(GetAllAnimeFailure(errorMessage: failure.errorMessage)),
        (allAnimeList) => emit(GetAllAnimeSuccess(allAnimeList: allAnimeList)));
  }


  Future searchAnime({required String animeName}) async {
    emit(SearchAnimeLoading());
    var result = await animeRepo.searchAnime(animeName: animeName);
    result.fold(
        (failure) =>
            emit(SearchAnimeFailure(errorMessage: failure.errorMessage)),
        (searchedAnimeList) =>
            emit(SearchAnimeSuccess(searchedAnimeList: searchedAnimeList)));
  }
}
