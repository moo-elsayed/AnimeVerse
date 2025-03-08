import 'package:anime_universe/constants.dart';
import 'package:flutter/material.dart';


import '../widgets/episodes_view_body.dart';
import 'details_view.dart';

class AnimeView extends StatelessWidget {
  const AnimeView({super.key, required this.title, required this.animeUrl});

  final String title;
  final String animeUrl;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: KMainColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(title),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: KSecondaryColor,
          bottom: TabBar(
            dividerColor: KSecondaryColor,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Details',
              ),
              Tab(
                text: 'Episodes',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DetailsView(animeUrl: animeUrl,),
            EpisodesViewBody(),
          ],
        ),
      ),
    );
  }
}
