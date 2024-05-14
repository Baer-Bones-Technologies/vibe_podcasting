// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      audioFile: json['audioFile'] as String,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      comments: (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String,
      dislikes: (json['dislikes'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      mediaLength: (json['mediaLength'] as num).toInt(),
      playtime: (json['playtime'] as num).toInt(),
      publishedAt: (json['publishedAt'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      title: json['title'] as String,
      videoFile: json['videoFile'] as String,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'audioFile': instance.audioFile,
      'chapters': instance.chapters.map((e) => e.toJson()).toList(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'description': instance.description,
      'dislikes': instance.dislikes,
      'likes': instance.likes,
      'mediaLength': instance.mediaLength,
      'playtime': instance.playtime,
      'publishedAt': instance.publishedAt,
      'title': instance.title,
      'videoFile': instance.videoFile,
    };
