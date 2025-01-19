import 'package:anime_universe/features/data/cubits/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/data/repos/anime_repo.dart';
import 'package:anime_universe/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/data/repos/anime_repo_imp.dart';
import 'features/presentation/views/home_view/home_view.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeCubit(AnimeRepoImp())..getAllAnime(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
