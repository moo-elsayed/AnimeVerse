import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/favorites/presentation/managers/favorite_cubit/favorite_cubit.dart';
import 'package:anime_universe/features/favorites/presentation/widgets/favorites_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/back_arrow.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    context.read<FavoriteCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: KSecondaryColor,
        title: Text('Favorites',style: TextStyle(color: Colors.white),),
      ),
      body: FavoritesViewBody(),
    );
  }
}
