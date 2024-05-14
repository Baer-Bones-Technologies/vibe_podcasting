import 'package:json_annotation/json_annotation.dart';
import 'package:vibe_podcasting/models/vibe_user.dart';

import '../domain/genre.dart';
import 'episode.dart';

part 'podcast.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Podcast {
  Podcast({
    required this.author,
    required this.coverArt,
    required this.episodes,
    required this.genres,
    required this.likes,
    required this.name,
  });

  final VibeUser author;
  final String coverArt;
  final List<Episode> episodes;
  final List<Genre> genres;
  final int likes;
  final String name;

  factory Podcast.fromJson(
    Map<String, dynamic> json,
  ) {
    return Podcast(
      author: json['author'],
      coverArt: json['coverArt'],
      episodes: json['episodes'],
      genres: json['genres'],
      likes: json['likes'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => _$PodcastToJson(
        this,
      );
}
