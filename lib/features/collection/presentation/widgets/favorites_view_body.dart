import 'package:anime_universe/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/no_results_widget.dart';
import '../managers/collection_cubit/collection_cubit.dart';
import '../managers/collection_cubit/collection_states.dart';
import 'favorites_list_view.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionCubit collectionCubit = context.read<CollectionCubit>();
    return BlocBuilder<CollectionCubit, CollectionStates>(
      builder: (context, state) {
        if (state is GetFavoritesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is GetFavoritesLoading) {
          return LoadingWidget();
        } else {
          if (collectionCubit.favoritesList.isNotEmpty) {
            return FavoritesAnimeListView();
          } else {
            return NoResultsWidget();
          }
        }
      },
    );
  }
}
