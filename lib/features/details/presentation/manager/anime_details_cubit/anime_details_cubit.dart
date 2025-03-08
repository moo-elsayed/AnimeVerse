import 'package:anime_universe/features/details/domain/repos/anime_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'anime_details_states.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsStates> {
  AnimeDetailsCubit(this.animeRepo) : super(AnimeDetailsInitial());
  final AnimeDetailsRepo animeRepo;

  Future getAnimeContent({required String animeId}) async {
    emit(GetAnimeContentLoading());
    var result = await animeRepo.getAnimeContent(animeId: animeId);
    result.fold(
        (failure) =>
            emit(GetAnimeContentFailure(errorMessage: failure.errorMessage)),
        (animeContent) =>
            emit(GetAnimeContentSuccess(animeContent: animeContent)));
  }
}
