// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vibe_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VibeUser _$VibeUserFromJson(Map<String, dynamic> json) => VibeUser(
      email: json['email'] as String,
      id: json['id'] as String,
      listeningHistory: (json['listeningHistory'] as List<dynamic>?)
              ?.map((e) => ListeningHistory.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      playbackProgress: (json['playbackProgress'] as List<dynamic>?)
              ?.map((e) => PlaybackProgress.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userPreferences: UserPreferences.fromJson(
          json['userPreferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VibeUserToJson(VibeUser instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'listeningHistory':
          instance.listeningHistory.map((e) => e.toJson()).toList(),
      'playbackProgress':
          instance.playbackProgress.map((e) => e.toJson()).toList(),
      'userPreferences': instance.userPreferences.toJson(),
    };
