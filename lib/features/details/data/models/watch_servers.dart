// To parse this JSON data, do
//
//     final watchServers = watchServersFromJson(jsonString);

import 'dart:convert';

WatchServers watchServersFromJson(String str) =>
    WatchServers.fromJson(json.decode(str));

String watchServersToJson(WatchServers data) => json.encode(data.toJson());

class WatchServers {
  List<Server> servers;

  WatchServers({
    required this.servers,
  });

  factory WatchServers.fromJson(Map<String, dynamic> json) => WatchServers(
        servers:
            List<Server>.from(json["servers"].map((x) => Server.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "servers": List<dynamic>.from(servers.map((x) => x.toJson())),
      };
}

class Server {
  Quality quality;
  String name;
  String url;

  Server({
    required this.quality,
    required this.name,
    required this.url,
  });

  factory Server.fromJson(Map<String, dynamic> json) => Server(
        quality: qualityValues.map[json["quality"]]!,
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "quality": qualityValues.reverse[quality],
        "name": name,
        "url": url,
      };
}

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
