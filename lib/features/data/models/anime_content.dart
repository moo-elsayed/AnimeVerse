// To parse this JSON data, do
//
//     final animeContent = animeContentFromJson(jsonString);

import 'dart:convert';

AnimeContent animeContentFromJson(String str) =>
    AnimeContent.fromJson(json.decode(str));

String animeContentToJson(AnimeContent data) => json.encode(data.toJson());

class AnimeContent {
  String title;
  String subtitle;
  String image;
  String startYear;
  String genre;
  String episodeDuration;
  String season;
  String episodeCount;
  String status;
  List<Episode> episodes;

  AnimeContent({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.startYear,
    required this.genre,
    required this.episodeDuration,
    required this.season,
    required this.episodeCount,
    required this.status,
    required this.episodes,
  });

  factory AnimeContent.fromJson(Map<String, dynamic> json) => AnimeContent(
        title: json["title"],
        subtitle: json["subtitle"],
        image: json["image"],
        startYear: json["سنة بداية العرض"],
        genre: json["النوع"],
        episodeDuration: json["مدة الحلقة"],
        season: json["الموسم"],
        episodeCount: json["عدد الحلقات"],
        status: json["حالة الأنمي"],
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "image": image,
        "سنة بداية العرض": startYear,
        "النوع": genre,
        "مدة الحلقة": episodeDuration,
        "الموسم": season,
        "عدد الحلقات": episodeCount,
        "حالة الأنمي": status,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
      };
}

class Episode {
  String thumbnail;
  String episodeUrl;
  String episodeNumber;

  Episode({
    required this.thumbnail,
    required this.episodeUrl,
    required this.episodeNumber,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        thumbnail: json["thumbnail"],
        episodeUrl: json["episode_url"],
        episodeNumber: json["episode_number"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "episode_url": episodeUrl,
        "episode_number": episodeNumber,
      };
}
