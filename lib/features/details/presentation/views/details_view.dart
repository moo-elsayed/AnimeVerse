
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/anime_details_cubit/anime_details_cubit.dart';
import '../manager/anime_details_cubit/anime_details_states.dart';
import '../widgets/details_view_body.dart';


class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.animeUrl});

  final String animeUrl;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    BlocProvider.of<AnimeDetailsCubit>(context)
        .getAnimeContent(animeId: widget.animeUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeDetailsCubit, AnimeDetailsStates>(
      builder: (context, state) {
        if (state is GetAnimeContentFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else if (state is GetAnimeContentSuccess) {
          return DetailsViewBody(
            animeContent: state.animeContent,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
