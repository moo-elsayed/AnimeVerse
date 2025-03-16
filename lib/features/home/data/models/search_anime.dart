// To parse this JSON data, do
//
//     final searchAnime = searchAnimeFromJson(jsonString);

import 'dart:convert';

import 'package:anime_universe/features/home/domain/entities/anime_entity.dart';

List<SearchAnime> searchAnimeFromJson(String str) => List<SearchAnime>.from(
    json.decode(str).map((x) => SearchAnime.fromJson(x)));

String searchAnimeToJson(List<SearchAnime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAnime extends AnimeEntity {
  String image;
  String alt;
  String animeUrl;
  String title;
  String episodes;

  SearchAnime({
    required this.image,
    required this.alt,
    required this.animeUrl,
    required this.title,
    required this.episodes,
  }) : super(
          image: image,
          title: title,
          animeUrl: animeUrl,
          episodes: episodes,
        );

  factory SearchAnime.fromJson(Map<String, dynamic> json) => SearchAnime(
        image: json["image"],
        alt: json["alt"],
        animeUrl: json["anime_url"],
        title: json["title"],
        episodes: json["episodes"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "alt": alt,
        "anime_url": animeUrl,
        "title": title,
        "episodes": episodes,
      };
}
