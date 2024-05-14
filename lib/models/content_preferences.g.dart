// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentPreferences _$ContentPreferencesFromJson(Map<String, dynamic> json) =>
    ContentPreferences(
      downloadPreferences: DownloadPreferences.fromJson(
          json['downloadPreferences'] as Map<String, dynamic>),
      explicitAllowed: json['explicitAllowed'] as bool? ?? false,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$GenreEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ContentPreferencesToJson(ContentPreferences instance) =>
    <String, dynamic>{
      'genres': instance.genres.map((e) => _$GenreEnumMap[e]!).toList(),
      'explicitAllowed': instance.explicitAllowed,
      'downloadPreferences': instance.downloadPreferences.toJson(),
    };

const _$GenreEnumMap = {
  Genre.trueCrime: 'trueCrime',
  Genre.comedy: 'comedy',
  Genre.news: 'news',
};
