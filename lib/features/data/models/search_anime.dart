// To parse this JSON data, do
//
//     final searchAnime = searchAnimeFromJson(jsonString);

import 'dart:convert';

List<SearchAnime> searchAnimeFromJson(String str) => List<SearchAnime>.from(json.decode(str).map((x) => SearchAnime.fromJson(x)));

String searchAnimeToJson(List<SearchAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchAnime {
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
  });

  factory SearchAnime.fromJson(Map<String, dynamic> json) => SearchAnime(
    image: json["image"],
    alt: json["alt"],
    animeUrl: json["anime_url"],
    title: json["title"],
    //episodes: json["episodes"],
    episodes: json["episodes"]?.toString() ?? "0", // التعامل مع جميع الحالات
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "alt": alt,
    "anime_url": animeUrl,
    "title": title,
    "episodes": episodes,
  };
}