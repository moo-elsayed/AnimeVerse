import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/no_results_widget.dart';
import '../managers/collection_cubit/collection_cubit.dart';
import '../managers/collection_cubit/collection_states.dart';
import 'anime_collection_list_view.dart';

class WatchingNowViewBody extends StatelessWidget {
  const WatchingNowViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionCubit collectionCubit = context.read<CollectionCubit>();
    return BlocBuilder<CollectionCubit, CollectionStates>(
      builder: (context, state) {
        if (state is GetWatchingFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is GetWatchingLoading) {
          return LoadingWidget();
        } else {
          if (collectionCubit.watchingList.isNotEmpty) {
            return AnimeCollectionListView(
              isFavorite: false,
            );
          } else {
            return NoResultsWidget();
          }
        }
      },
    );
  }
}
