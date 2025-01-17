// To parse this JSON data, do
//
//     final allAnime = allAnimeFromJson(jsonString);

import 'dart:convert';

List<AllAnime> allAnimeFromJson(String str) =>
    List<AllAnime>.from(json.decode(str).map((x) => AllAnime.fromJson(x)));

String allAnimeToJson(List<AllAnime> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        episodes: List<Episode>.from(
            json["episodes"].map((x) => Episode.fromJson(x))),
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
        servers:
            List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "episode_number": episodeNumber,
        "episode_url": episodeUrl,
        "servers": List<dynamic>.from(servers.map((x) => x.toJson())),
      };
}

class Server {
  Name name;
  Quality quality;
  String url;

  Server({
    required this.name,
    required this.quality,
    required this.url,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        name: nameValues.map[json["name"]]!,
        quality: qualityValues.map[json["quality"]]!,
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse[name],
        "quality": qualityValues.reverse[quality],
        "url": url,
      };
}

enum Name {
  FH_DMEGA,
  FH_DMP4_UPLOAD,
  FH_DOK_RU,
  H_DMEGA,
  H_DMEGAMAX_ME,
  H_DMP4_UPLOAD,
  H_DOK_RU,
  H_DSENDVID,
  H_DUQLOAD,
  H_DVIDMOLY_TO,
  S_DMEGA,
  S_DMP4_UPLOAD,
  S_DOK_RU
}

final nameValues = EnumValues({
  "FHDmega": Name.FH_DMEGA,
  "FHDmp4upload": Name.FH_DMP4_UPLOAD,
  "FHDok ru": Name.FH_DOK_RU,
  "HDmega": Name.H_DMEGA,
  "HDmegamax me": Name.H_DMEGAMAX_ME,
  "HDmp4upload": Name.H_DMP4_UPLOAD,
  "HDok ru": Name.H_DOK_RU,
  "HDsendvid": Name.H_DSENDVID,
  "HDuqload": Name.H_DUQLOAD,
  "HDvidmoly to": Name.H_DVIDMOLY_TO,
  "SDmega": Name.S_DMEGA,
  "SDmp4upload": Name.S_DMP4_UPLOAD,
  "SDok ru": Name.S_DOK_RU
});

enum Quality { FHD, HD, SD }

final qualityValues =
    EnumValues({"FHD": Quality.FHD, "HD": Quality.HD, "SD": Quality.SD});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
