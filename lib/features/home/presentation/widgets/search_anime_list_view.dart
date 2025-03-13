import 'package:anime_universe/features/home/data/models/search_anime.dart';
import 'package:anime_universe/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:anime_universe/features/home/presentation/widgets/search_anime_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAnimeListView extends StatelessWidget {
  const SearchAnimeListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<SearchAnime> searchAnimeList =
        BlocProvider.of<SearchCubit>(context).searchList;
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: searchAnimeList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: MediaQuery.of(context).size.width * .02,
        childAspectRatio: 2.6 / 5,
        mainAxisSpacing: MediaQuery.of(context).size.width * .01,
      ),
      itemBuilder: (context, index) {
        return SearchAnimeItem(
          searchAnime: searchAnimeList[index],
        );
      },
    );
  }
}
