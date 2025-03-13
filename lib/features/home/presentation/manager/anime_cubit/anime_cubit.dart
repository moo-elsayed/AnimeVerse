import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/anime_repo.dart';
import 'anime_states.dart';

class AnimeCubit extends Cubit<AnimeStates> {
  AnimeCubit(this.animeRepo) : super(AnimeInitial());
  final AnimeRepo animeRepo;

  Future getAllAnime() async {
    emit(GetAllAnimeLoading());
    var result = await animeRepo.getAllAnime();
    result.fold((failure) => emit(GetAllAnimeFailure(errorMessage: failure)),
        (allAnimeList) => emit(GetAllAnimeSuccess(allAnimeList: allAnimeList)));
  }
}
