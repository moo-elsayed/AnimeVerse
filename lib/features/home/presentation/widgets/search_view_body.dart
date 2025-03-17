import 'dart:developer';

import 'package:anime_universe/core/widgets/error_widget.dart';
import 'package:anime_universe/core/widgets/no_results_widget.dart';
import 'package:anime_universe/features/home/presentation/widgets/search_anime_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import '../manager/anime_cubit/anime_states.dart';
import 'empty_search_widget.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeStates>(
      builder: (context, state) {
        if (state is SearchAnimeSuccess) {
          return SearchAnimeListView();
        } else if (state is SearchAnimeFailure) {
          log(state.errorMessage);
          if (state.errorMessage ==
              'An error occurred: 404: No results found') {
            return NoResultsWidget();
          } else {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          }
        } else if (state is SearchAnimeLoading) {
          return LoadingWidget();
        } else {
          return EmptySearchWidget();
        }
      },
    );
  }
}
