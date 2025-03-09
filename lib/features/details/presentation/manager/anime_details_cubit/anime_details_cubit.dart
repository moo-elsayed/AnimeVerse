import 'package:anime_universe/features/details/data/models/anime_content.dart';
import 'package:anime_universe/features/details/domain/repos/anime_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'anime_details_states.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsStates> {
  AnimeDetailsCubit(this.animeRepo) : super(AnimeDetailsInitial());
  final AnimeDetailsRepo animeRepo;

  String? animeID;
  List<Episode> episodes = [];

  Future getAnimeContent({required String animeId}) async {
    // عشان منعملش ال request تاني على الفاضي لو نفس الانمي
    if (animeID != null && animeId == animeID) {
      return;
    }
    animeID = animeId;

    emit(GetAnimeContentLoading());
    var result = await animeRepo.getAnimeContent(animeId: animeId);
    result.fold(
      (failure) =>
          emit(GetAnimeContentFailure(errorMessage: failure.errorMessage)),
      (animeContent) {
        episodes = animeContent.episodes
          ..sort((a, b) {
            int numA = int.tryParse(a.episodeNumber.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
            int numB = int.tryParse(b.episodeNumber.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
            return numA.compareTo(numB);
          });
        emit(GetAnimeContentSuccess(animeContent: animeContent));
      },
    );
  }
}
