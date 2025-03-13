import 'package:anime_universe/features/home/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../constants.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        title: Text(
          'AnimeVerse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        //centerTitle: true,
        backgroundColor: KSecondaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              context.pushTransition(
                type: PageTransitionType.leftToRight,
                //duration: Duration(milliseconds: 230),
                child: SearchView(),
              );
            },
          )
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
