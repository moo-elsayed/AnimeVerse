import 'dart:developer';
import 'package:anime_universe/constants.dart';
import 'package:anime_universe/features/collection/presentation/views/set_api_key_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utlis/functions.dart';
import '../views/favorites_view.dart';
import '../views/watching_now_view.dart';
import 'drawer_item.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> drawerItemList =
        getDrawerItemList(context, Uri.parse(KUrl));
    return Column(
      children: List.generate(
        drawerItemList.length,
        (index) {
          return DrawerItem(
            title: drawerItemList[index]['title'],
            iconData: drawerItemList[index]['iconData'],
            onTap: drawerItemList[index]['onTap'],
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> getDrawerItemList(BuildContext context, Uri url) {
  return [
    {
      'title': 'Favorites',
      'iconData': Icons.favorite,
      'onTap': () {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          //duration: Duration(milliseconds: 230),
          child: FavoritesView(),
        );
      },
    },
    {
      'title': 'Watching now',
      'iconData': Icons.play_circle,
      'onTap': () {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          child: WatchingNowView(),
        );
      },
    },
    {
      'title': 'Get An api key',
      'iconData': Icons.public,
      'onTap': () async {
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode.externalApplication,
          );
        } else {
          showCustomSnackBar(
            title: 'Error!',
            context: context,
            message: 'Could not launch url',
            contentType: ContentType.failure,
          );
        }
      },
    },
    {
      'title': 'Set api key',
      'iconData': Icons.key,
      'onTap': () {
        context.pushTransition(
          type: PageTransitionType.leftToRight,
          child: UpdateApiKeyView(),
        );
      },
    },
  ];
}
