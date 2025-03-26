import 'package:anime_universe/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../managers/collection_cubit/collection_cubit.dart';
import '../widgets/favorites_view_body.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    context.read<CollectionCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: KSecondaryColor,
        surfaceTintColor: KSecondaryColor,
        title: Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FavoritesViewBody(),
    );
  }
}
