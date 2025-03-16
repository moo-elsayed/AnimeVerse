import 'package:anime_universe/core/widgets/loading_widget.dart';
import 'package:anime_universe/features/favorites/presentation/managers/favorite_cubit/favorite_cubit.dart';
import 'package:anime_universe/features/favorites/presentation/managers/favorite_cubit/favorite_states.dart';
import 'package:anime_universe/features/favorites/presentation/widgets/favorites_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        if (state is GetFavoritesFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is GetFavoritesLoading) {
          return LoadingWidget();
        } else {
          return FavoritesAnimeListView();
        }
      },
    );
  }
}
