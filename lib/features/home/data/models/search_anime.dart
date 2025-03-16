// To parse this JSON data, do
//
//     final searchAnime = searchAnimeFromJson(jsonString);

import 'dart:convert';


List<SearchAnime> searchAnimeFromJson(String str) => List<SearchAnime>.from(
    json.decode(str).map((x) => SearchAnime.fromJson(x)));

String searchAnimeToJson(List<SearchAnime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAnime {
  String image;
  String alt;
  String animeId;
  String title;
  String episodes;

  SearchAnime({
    required this.image,
    required this.alt,
    required this.animeId,
    required this.title,
    required this.episodes,
  });

  factory SearchAnime.fromJson(Map<String, dynamic> json) => SearchAnime(
        image: json["image"],
        alt: json["alt"],
        animeId: json["anime_url"],
        title: json["title"],
        episodes: json["episodes"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "alt": alt,
        "anime_url": animeId,
        "title": title,
        "episodes": episodes,
      };
}
