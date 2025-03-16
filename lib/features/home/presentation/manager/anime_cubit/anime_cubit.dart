import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/all_anime.dart';
import '../../../data/models/search_anime.dart';
import '../../../domain/repos/anime_repo.dart';
import 'anime_states.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit(this.animeRepo) : super(AnimeInitial());
  final AnimeRepo animeRepo;

  List<AllAnime> allAnimeList = [];
  String? searchString;
  List<SearchAnime> searchList = [];

  Future searchAnime({required String animeName}) async {
    // عشان منعملش ال request تاني على الفاضي لو نفس الانمي
    if (searchString != null && searchString == animeName) {
      return;
    }
    searchString = animeName;

    emit(SearchAnimeLoading());
    var result = await animeRepo.searchAnime(animeName: animeName);
    result.fold((failure) => emit(SearchAnimeFailure(errorMessage: failure)),
        (searchedAnimeList) {
      searchList = searchedAnimeList;
      emit(SearchAnimeSuccess(searchedAnimeList: searchedAnimeList));
    });
  }

  void emptySearchList() {
    searchList = [];
    searchString = null;
    emit(SearchInitial());
  }

  Future getAllAnime() async {
    emit(GetAllAnimeLoading());
    var result = await animeRepo.getAllAnime();
    result.fold(
      (failure) => emit(GetAllAnimeFailure(errorMessage: failure)),
      (allAnimeList) {
        this.allAnimeList = allAnimeList;
        emit(GetAllAnimeSuccess(allAnimeList: allAnimeList));
      },
    );
  }
}
