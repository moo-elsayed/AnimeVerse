import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../manager/anime_cubit/anime_cubit.dart';
import '../manager/anime_cubit/anime_states.dart';
import 'all_anime_listView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeCubit, AnimeStates>(
      builder: (context, state) {
        if (state is GetAllAnimeLoading) {
          return LoadingWidget();
        } else if (state is GetAllAnimeFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is GetAllAnimeSuccess) {
          return AllAnimeListview(allAnimeList: state.allAnimeList);
        } else {
          AnimeCubit animeCubit = context.read<AnimeCubit>();
          return animeCubit.allAnimeList.isEmpty
              ? SizedBox()
              : AllAnimeListview(allAnimeList: animeCubit.allAnimeList);
        }
      },
    );
  }
}
