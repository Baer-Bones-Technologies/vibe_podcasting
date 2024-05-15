import 'package:json_annotation/json_annotation.dart';

import 'chapter.dart';
import 'comment.dart';

part 'episode.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Episode {
  const Episode({
    required this.audioFile,
    required this.chapters,
    required this.comments,
    required this.description,
    required this.dislikes,
    required this.likes,
    required this.mediaLength,
    required this.playtime,
    required this.publishedAt,
    required this.title,
    required this.videoFile,
  });

  final String audioFile;
  final List<Chapter> chapters;
  final List<Comment> comments;
  final String description;
  final int dislikes;
  final int likes;
  final int mediaLength;
  final int playtime;
  final List<String> publishedAt;
  final String title;
  final String videoFile;

  factory Episode.fromJson(
    Map<String, dynamic> json,
  ) => _$EpisodeFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$EpisodeToJson(
        this,
      );
}
