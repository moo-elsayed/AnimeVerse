import 'package:anime_universe/core/utlis/anime_service.dart';
import 'package:anime_universe/features/details/domain/repos/anime_details_repo_imp.dart';
import 'package:anime_universe/features/details/presentation/manager/watch_servers_cubit/watch_servers_cubit.dart';
import 'package:anime_universe/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/collection/data/data_sources/anime_local_data_source.dart';
import 'features/collection/domain/repos/collection_rpo_imp.dart';
import 'features/collection/presentation/managers/collection_cubit/collection_cubit.dart';
import 'features/details/presentation/manager/anime_details_cubit/anime_details_cubit.dart';
import 'features/home/domain/repos/anime_repo_imp.dart';
import 'features/home/presentation/manager/anime_cubit/anime_cubit.dart';
import 'features/home/presentation/views/home_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AnimeCubit(AnimeRepoImp(animeService: AnimeService()))
                ..checkFirstTime(),
        ),
        BlocProvider(
          create: (context) => AnimeDetailsCubit(
              AnimeDetailsRepoImp(animeService: AnimeService())),
        ),
        BlocProvider(
          create: (context) => WatchServersCubit(
              AnimeDetailsRepoImp(animeService: AnimeService())),
        ),
        BlocProvider(
          create: (context) => CollectionCubit(
            CollectionRepoImp(
              animeLocalDataSource: AnimeLocalDataSource(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
