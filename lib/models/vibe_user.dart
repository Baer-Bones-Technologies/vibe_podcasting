import 'package:json_annotation/json_annotation.dart';
import 'package:vibe_podcasting/models/playback_progress.dart';
import 'package:vibe_podcasting/models/user_preferences.dart';

import 'listening_history.dart';

part 'vibe_user.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class VibeUser{
  VibeUser({
    required this.email,
    required this.id,
    this.listeningHistory = const [],
    this.playbackProgress = const [],
    required this.userPreferences,
    this.username,
});

  final String email;
  final String id;
  final List<ListeningHistory> listeningHistory;
  final List<PlaybackProgress> playbackProgress;
  final UserPreferences userPreferences;
  final String? username;

  factory VibeUser.fromJson(
    Map<String, dynamic> json,
  ) {
    return VibeUser(
      email: json['email'],
      id: json['id'],
      listeningHistory: json['listeningHistory'],
      playbackProgress: json['playbackProgress'],
      userPreferences: json['userPreferences'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() => _$VibeUserToJson(
        this,
      );
}


