import 'package:json_annotation/json_annotation.dart';

import 'content_preferences.dart';
import 'download_preferences.dart';
import 'notification_preferences.dart';
import 'playback_preferences.dart';

part 'user_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class UserPreferences {
  const UserPreferences(
      {
      this.contentPreferences = const ContentPreferences(downloadPreferences: DownloadPreferences()),
      this.notificationPreferences = const NotificationPreferences(),
      this.playbackPreferences = const PlaybackPreferences(),
      this.profilePicture = '',
      required this.username,
      });

  final String profilePicture;
  final String username;
  final ContentPreferences contentPreferences;
  final NotificationPreferences notificationPreferences;
  final PlaybackPreferences playbackPreferences;

  factory UserPreferences.fromJson(
    Map<String, dynamic> json,
  ) => _$UserPreferencesFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$UserPreferencesToJson(
        this,
      );
}
