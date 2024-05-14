import 'package:json_annotation/json_annotation.dart';

import '../domain/genre.dart';
import 'download_preferences.dart';

part 'content_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class ContentPreferences{
  const ContentPreferences({
    required this.downloadPreferences,
    this.explicitAllowed = false,
    this.genres = const [],
});
  final List<Genre> genres;
  final bool explicitAllowed;
  final DownloadPreferences downloadPreferences;

  factory ContentPreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    return ContentPreferences(
      downloadPreferences: json['downloadPreferences'],
      explicitAllowed: json['explicitAllowed'],
      genres: json['genres'],
    );
  }

  Map<String, dynamic> toJson() => _$ContentPreferencesToJson(
        this,
      );
}