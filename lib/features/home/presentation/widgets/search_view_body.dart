import 'package:anime_universe/features/home/presentation/widgets/search_anime_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import '../manager/anime_cubit/anime_states.dart';
import 'empty_search_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    AnimeCubit animeCubit = context.read<AnimeCubit>();
    return BlocBuilder<AnimeCubit, AnimeStates>(
      builder: (context, state) {
        if (state is SearchAnimeSuccess) {
          return SearchAnimeListView();
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
          return EmptySearchWidget();
        }
      },
    );
  }
}
