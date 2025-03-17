class AnimeModel {
  String image;
  String animeId;
  String title;
  String episodes;

  AnimeModel({
    required this.image,
    required this.animeId,
    required this.title,
    required this.episodes,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        animeId: json["anime_id"],
        title: json["title"],
        image: json["image"],
        episodes: json["episodes"],
      );

  Map<String, dynamic> toJson() => {
        "anime_id": animeId,
        "title": title,
        "image": image,
        "episodes": episodes,
      };
}
