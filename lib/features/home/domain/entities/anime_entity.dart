// To parse this JSON data, do
//
//     final animeEntity = animeEntityFromJson(jsonString);

import 'dart:convert';

AnimeEntity animeEntityFromJson(String str) =>
    AnimeEntity.fromJson(json.decode(str));

String animeEntityToJson(AnimeEntity data) => json.encode(data.toJson());

class AnimeEntity {
  String image;
  String animeUrl;
  String title;
  String episodes;

  AnimeEntity({
    required this.image,
    required this.animeUrl,
    required this.title,
    required this.episodes,
  });

  factory AnimeEntity.fromJson(Map<String, dynamic> json) => AnimeEntity(
        image: json["image"],
        animeUrl: json["anime_url"],
        title: json["title"],
        episodes: json["episodes"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "anime_url": animeUrl,
        "title": title,
        "episodes": episodes,
      };
}
