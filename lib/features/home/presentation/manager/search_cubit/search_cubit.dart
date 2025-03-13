import 'package:anime_universe/features/home/data/models/search_anime.dart';
import 'package:anime_universe/features/home/presentation/manager/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/anime_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.animeRepo) : super(SearchInitial());
  final AnimeRepo animeRepo;
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
  }
}
