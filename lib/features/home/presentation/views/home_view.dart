import 'package:flutter/material.dart';

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
            onPressed: () {},
          )
          // Container(
          //   padding: EdgeInsets.all(10),
          //   width: MediaQuery.of(context).size.width * .5,
          //   child: CustomTextFormField(
          //     controller: searchController,
          //     prefixIcon: Icon(Icons.search, color: Colors.white,),
          //     hintText: '',
          //     labelText: 'search',
          //   ),
          // )
        ],
      ),
      body: HomeViewBody(),
    );
  }
}
