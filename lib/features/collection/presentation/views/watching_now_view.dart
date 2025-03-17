import 'package:anime_universe/features/collection/presentation/widgets/watching_now_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../managers/collection_cubit/collection_cubit.dart';

class WatchingNowView extends StatefulWidget {
  const WatchingNowView({super.key});

  @override
  State<WatchingNowView> createState() => _WatchingNowViewState();
}

class _WatchingNowViewState extends State<WatchingNowView> {

  @override
  void initState() {
    context.read<CollectionCubit>().getWatching();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: KSecondaryColor,
        title: Text(
          'Watching now',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WatchingNowViewBody(),
    );
  }
}
