import 'package:anime_universe/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:anime_universe/features/home/presentation/widgets/search_anime_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/search_anime.dart';
import '../manager/search_cubit/search_states.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      builder: (context, state) {
        if (state is SearchAnimeSuccess) {
          //List<SearchAnime> searchAnimeList = state.searchedAnimeList;
          return SearchAnimeListView(

          );
        } else if (state is SearchAnimeFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is SearchAnimeLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
