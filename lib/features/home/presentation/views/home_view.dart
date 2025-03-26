import 'package:anime_universe/features/home/presentation/manager/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/home/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../constants.dart';
import '../../../collection/presentation/views/drawer_view.dart';
import '../widgets/first_time_view_body.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<AnimeCubit>().getAllAnime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool? isFirstTime = context.watch<AnimeCubit>().firstTime;

    return Scaffold(
      backgroundColor: KMainColor,
      drawer: Drawer(
        child: DrawerView(),
        backgroundColor: KMainColor,
      ),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          'AnimeVerse',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: KSecondaryColor,
        surfaceTintColor: KSecondaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              context.pushTransition(
                type: PageTransitionType.leftToRight,
                child: SearchView(),
              );
            },
          )
        ],
      ),
      body: isFirstTime == null
          ? SizedBox()
          : (isFirstTime == false ? HomeViewBody() : firstTimeViewBody()),
    );
  }
}
