import 'package:anime_universe/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../widgets/episodes_view_body.dart';
import 'details_view.dart';

class AnimeView extends StatefulWidget {
  const AnimeView({super.key, required this.title, required this.animeId});

  final String title;
  final String animeId;

  @override
  State<AnimeView> createState() => _AnimeViewState();
}

class _AnimeViewState extends State<AnimeView> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    _pages = [
      DetailsView(animeId: widget.animeId),
      EpisodesViewBody(),
    ];
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
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(widget.title),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: KSecondaryColor,
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
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            padding: EdgeInsets.all(16),
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
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
