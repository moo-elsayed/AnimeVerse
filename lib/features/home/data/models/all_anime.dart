// To parse this JSON data, do
//
//     final allAnime = allAnimeFromJson(jsonString);

import 'dart:convert';

import '../../../../core/models/server.dart';

List<AllAnime> allAnimeFromJson(String str) => List<AllAnime>.from(json.decode(str).map((x) => AllAnime.fromJson(x)));

String allAnimeToJson(List<AllAnime> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllAnime {
  int id;
  String title;
  String animeName;
  String image;
  String animeUrl;
  List<Episode> episodes;

  AllAnime({
    required this.id,
    required this.title,
    required this.animeName,
    required this.image,
    required this.animeUrl,
    required this.episodes,
  });

  factory AllAnime.fromJson(Map<String, dynamic> json) => AllAnime(
    id: json["id"],
    title: json["title"],
    animeName: json["anime_name"],
    image: json["image"],
    animeUrl: json["anime_url"],
    episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "anime_name": animeName,
    "image": image,
    "anime_url": animeUrl,
    "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
  };
}

class Episode {
  String episodeNumber;
  String episodeUrl;
  List<Server> servers;

  Episode({
    required this.episodeNumber,
    required this.episodeUrl,
    required this.servers,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
    episodeNumber: json["episode_number"],
    episodeUrl: json["episode_url"],
    servers: List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "episode_number": episodeNumber,
    "episode_url": episodeUrl,
    "servers": List<dynamic>.from(servers.map((x) => x.toJson())),
  };
}



enum Name {
  FH_DDAILYMOTION,
  FH_DMEGA,
  FH_DMP4_UPLOAD,
  FH_DOK_RU,
  H_DD000_D,
  H_DDAILYMOTION,
  H_DMEGA,
  H_DMEGAMAX_ME,
  H_DMP4_UPLOAD,
  H_DOK_RU,
  H_DSENDVID,
  H_DUQLOAD,
  H_DVIDMOLY_TO,
  H_DVOE_SX,
  S_DMEGA,
  S_DMP4_UPLOAD,
  S_DOK_RU
}

final nameValues = EnumValues({
  "FHDdailymotion": Name.FH_DDAILYMOTION,
  "FHDmega": Name.FH_DMEGA,
  "FHDmp4upload": Name.FH_DMP4_UPLOAD,
  "FHDok ru": Name.FH_DOK_RU,
  "HDd000d": Name.H_DD000_D,
  "HDdailymotion": Name.H_DDAILYMOTION,
  "HDmega": Name.H_DMEGA,
  "HDmegamax me": Name.H_DMEGAMAX_ME,
  "HDmp4upload": Name.H_DMP4_UPLOAD,
  "HDok ru": Name.H_DOK_RU,
  "HDsendvid": Name.H_DSENDVID,
  "HDuqload": Name.H_DUQLOAD,
  "HDvidmoly to": Name.H_DVIDMOLY_TO,
  "HDvoe sx": Name.H_DVOE_SX,
  "SDmega": Name.S_DMEGA,
  "SDmp4upload": Name.S_DMP4_UPLOAD,
  "SDok ru": Name.S_DOK_RU
});

enum Quality {
  FHD,
  HD,
  SD
}

final qualityValues = EnumValues({
  "FHD": Quality.FHD,
  "HD": Quality.HD,
  "SD": Quality.SD
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
