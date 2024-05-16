// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Podcast _$PodcastFromJson(Map<String, dynamic> json) => Podcast(
      author: VibeUser.fromJson(json['author'] as Map<String, dynamic>),
      coverArt: json['coverArt'] as String,
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => $enumDecode(_$GenreEnumMap, e))
          .toList(),
      likes: (json['likes'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PodcastToJson(Podcast instance) => <String, dynamic>{
      'author': instance.author.toJson(),
      'coverArt': instance.coverArt,
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
      'genres': instance.genres.map((e) => _$GenreEnumMap[e]!).toList(),
      'likes': instance.likes,
      'name': instance.name,
    };

const _$GenreEnumMap = {
  Genre.trueCrime: 'trueCrime',
  Genre.comedy: 'comedy',
  Genre.news: 'news',
  Genre.history: 'history',
  Genre.science: 'science',
  Genre.technology: 'technology',
  Genre.business: 'business',
};
