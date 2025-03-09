import 'dart:developer';

import 'package:anime_universe/core/utlis/api_service.dart';
import 'package:anime_universe/features/details/data/models/anime_content.dart';

import '../../features/home/data/models/all_anime.dart';
import '../../features/home/data/models/search_anime.dart';
import '../../features/details/data/models/watch_servers.dart';




class AnimeService {
  final ApiService apiService = ApiService();

  Future<List<AllAnime>> getAllAnime() async {
    var response = await apiService.get(url: '${apiService.baseUrl}anime');
    return List<AllAnime>.from(
      response.data.map((anime) => AllAnime.fromJson(anime)),
    );
    //return AllAnime.fromJson(response.data);
  }

  Future<List<SearchAnime>> searchAnime({required String animeName}) async {
    var response =
        await apiService.get(url: '${apiService.baseUrl}search/web/$animeName');
    // log("Data received: ${response.data}");
    //print("Type of episodes: ${json["episodes"].runtimeType}");

    return List<SearchAnime>.from(
      response.data.map((anime) => SearchAnime.fromJson(anime)),
    );
    //return SearchAnime.fromJson(response.data);
  }

  Future<AnimeContent> getAnimeContent({required String animeId}) async {
    log(animeId);
    var response = await apiService.get(
        url: '${apiService.baseUrl}anime/details/$animeId');
    return AnimeContent.fromJson(response.data);
  }

  Future<WatchServers> getWatchServes({required String episodeUrl}) async {
    var response = await apiService.get(
        url: '${apiService.baseUrl}episode/servers/$episodeUrl');
    return WatchServers.fromJson(response.data);
  }
}
