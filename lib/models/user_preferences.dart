import 'package:json_annotation/json_annotation.dart';
import 'package:vibe_podcasting/models/content_preferences.dart';
import 'package:vibe_podcasting/models/download_preferences.dart';
import 'package:vibe_podcasting/models/notification_preferences.dart';
import 'package:vibe_podcasting/models/playback_preferences.dart';

part 'user_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class UserPreferences {
  UserPreferences(
      {required this.birthday,
      required this.age,
      required this.contentPreferences,
      required this.downloadPreferences,
      required this.notificationPreferences,
      required this.playbackPreferences});

  final DateTime birthday;
  final int age;
  final ContentPreferences contentPreferences;
  final DownloadPreferences downloadPreferences;
  final NotificationPreferences notificationPreferences;
  final PlaybackPreferences playbackPreferences;

  factory UserPreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserPreferences(
      birthday: json['birthday'],
      age: json['age'],
      contentPreferences: ContentPreferences.fromJson(json['contentPreferences']),
      downloadPreferences: DownloadPreferences.fromJson(json['downloadPreferences']),
      notificationPreferences: NotificationPreferences.fromJson(json['notificationPreferences']),
      playbackPreferences: PlaybackPreferences.fromJson(json['playbackPreferences']),
    );
  }

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(
        this,
      );
}
