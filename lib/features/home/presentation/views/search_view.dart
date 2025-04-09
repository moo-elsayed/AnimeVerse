import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/home/presentation/manager/anime_cubit/anime_cubit.dart';
import 'package:anime_universe/features/home/presentation/widgets/custom_search_textFormField.dart';
import 'package:anime_universe/features/home/presentation/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/back_arrow.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();
  FocusNode textFieldFocus = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeCubit>().emptySearchList();
      textFieldFocus.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AnimeCubit animeCubit = context.read<AnimeCubit>();
    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(
        leading: BackArrow(),
        backgroundColor: KSecondaryColor,
        surfaceTintColor: KSecondaryColor,
        title: CustomSearchTextFormField(
          controller: searchController,
          hintText: 'Enter anime name',
          focusNode: textFieldFocus,
          onFieldSubmitted: (value) {
            context.read<AnimeCubit>().searchAnime(animeName: value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (searchController.text.isNotEmpty) {
                animeCubit.searchAnime(animeName: searchController.text.trim());
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
