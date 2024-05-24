import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'listening_history.dart';
import 'playback_progress.dart';
import 'user_preferences.dart';

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
});

  final String email;
  final String id;
  final List<ListeningHistory> listeningHistory;
  final List<PlaybackProgress> playbackProgress;
  final UserPreferences userPreferences;

  factory VibeUser.fromJson(
    Map<String, dynamic> json,
  ) => _$VibeUserFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$VibeUserToJson(
        this,
      );

  static Future<VibeUser?> getUser(String? uid) async {
    final database = FirebaseFirestore.instance;
    final user = await database.collection('users').doc(uid).get();
    if (user.exists) {
      return VibeUser.fromJson(user.data()!);
    } else {
      return null;
    }
  }
}


