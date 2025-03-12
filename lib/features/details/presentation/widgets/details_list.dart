import 'package:anime_universe/features/details/presentation/manager/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_universe/features/details/presentation/widgets/details_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsList extends StatelessWidget {
  const DetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> list =
        BlocProvider.of<AnimeDetailsCubit>(context).detailsList;
    return Column(
      spacing: 8,
      children: List.generate(
        list.length,
        (index) {
          return DetailsListItem(
            detailKey: list[index]['detailKey']!,
            value: list[index]['value']!,
          );
        },
      ),
    );
  }
}
