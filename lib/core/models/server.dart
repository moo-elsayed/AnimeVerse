// import '../../features/home/data/models/all_anime.dart';
//
// class Server {
//   Name name;
//   Quality quality;
//   String url;
//
//   Server({
//     required this.name,
//     required this.quality,
//     required this.url,
//   });
//
//   factory Server.fromJson(Map<String, dynamic> json) => Server(
//     name: nameValues.map[json["name"]]!,
//     quality: qualityValues.map[json["quality"]]!,
//     url: json["url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": nameValues.reverse[name],
//     "quality": qualityValues.reverse[quality],
//     "url": url,
//   };
// }

// To parse this JSON data, do
//
//     final servers = serversFromJson(jsonString);

import 'dart:convert';

List<Server> serversFromJson(String str) => List<Server>.from(json.decode(str).map((x) => Server.fromJson(x)));

String serversToJson(List<Server> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Server {
  String quality;
  String name;
  String url;

  Server({
    required this.quality,
    required this.name,
    required this.url,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
    quality: json["quality"],
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "quality": quality,
    "name": name,
    "url": url,
  };
}
