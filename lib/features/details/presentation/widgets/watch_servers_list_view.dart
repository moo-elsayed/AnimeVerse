import 'package:anime_universe/core/models/server.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';

class WatchServersListView extends StatelessWidget {
  const WatchServersListView(
      {super.key, required this.serversList, required this.trim});

  final List<Server> serversList;
  final bool trim;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: serversList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: index == serversList.length - 1 ? 10 : 0,
            right: 10,
            left: 10,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: ShapeDecoration(
              color: KSecondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trim == true
                      ? serversList[index].quality == 'FHD'
                          ? serversList[index].name.substring(3)
                          : serversList[index].name.substring(2)
                      : serversList[index].name,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
                Text(
                  serversList[index].quality,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
