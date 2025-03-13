import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/home/presentation/manager/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:anime_universe/features/home/presentation/widgets/custom_textFormField.dart';
import 'package:anime_universe/features/home/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SearchCubit searchCubit = BlocProvider.of<SearchCubit>(context);
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            searchCubit.emptySearchList();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: KSecondaryColor,
        title: CustomTextFormField(
          controller: searchController,
          hintText: 'Enter anime name',
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (searchController.text.isNotEmpty) {
                searchCubit.searchAnime(animeName: searchController.text);
              }
            },
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SearchViewBody(),
    );
  }
}
