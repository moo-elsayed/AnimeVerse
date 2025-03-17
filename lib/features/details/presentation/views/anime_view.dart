import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/details/presentation/manager/anime_details_cubit/anime_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../core/widgets/back_arrow.dart';
import '../../../../core/widgets/error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';

import '../../../collection/data/models/anime_model.dart';
import '../../../collection/presentation/managers/collection_cubit/collection_cubit.dart';
import '../manager/anime_details_cubit/anime_details_states.dart';
import '../widgets/details_view_body.dart';
import '../widgets/episodes_view_body.dart';

class AnimeView extends StatefulWidget {
  const AnimeView(
      {super.key,
      required this.title,
      required this.animeId,
      required this.image,
      required this.episodes,
      required this.isFavorite});

  final String title;
  final String animeId;
  final String image;
  final String episodes;
  final bool isFavorite;

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> {
  int _currentIndex = 0;
  late bool r;

  @override
  void initState() {
    BlocProvider.of<AnimeDetailsCubit>(context)
        .getAnimeContent(animeId: widget.animeId);

    r = widget.isFavorite;

    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        title: Text(widget.title),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: KSecondaryColor,
        actions: _currentIndex == 1
            ? [
                IconButton(
                  icon: Icon(Icons.sort, color: Colors.white),
                  onPressed: () {
                    BlocProvider.of<AnimeDetailsCubit>(context).reverse();
                    setState(() {});
                  },
                )
              ]
            : [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_outlined,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: Icon(
                      r == true
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.white),
                  onPressed: () {
                    r == true
                        ? context
                            .read<CollectionCubit>()
                            .removeFavorite(animeId: widget.animeId)
                        : context.read<CollectionCubit>().addFavorite(
                              anime: AnimeModel(
                                image: widget.image,
                                animeId: widget.animeId,
                                title: widget.title,
                                episodes: widget.episodes,
                              ),
                              status: 'favorite',
                            );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Hello')));
                    setState(() {
                      r = !r;
                    });
                  },
                )
              ],
      ),
      bottomNavigationBar: Container(
        color: KSecondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
          child: GNav(
            onTabChange: (value) {
              _onItemTapped(value);
            },
            tabBorderRadius: 24,
            backgroundColor: KSecondaryColor,
            activeColor: KMainColor,
            tabBackgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.info,
                text: 'Details',
              ),
              GButton(
                icon: Icons.video_library,
                text: 'Episodes',
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<AnimeDetailsCubit, AnimeDetailsStates>(
        builder: (context, state) {
          if (state is GetAnimeContentFailure) {
            return CustomErrorWidget(errorMessage: state.errorMessage);
          } else if (state is GetAnimeContentSuccess) {
            return IndexedStack(
              index: _currentIndex,
              children: [
                DetailsViewBody(animeContent: state.animeContent),
                EpisodesViewBody(),
              ],
            );
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
