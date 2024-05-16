// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      contentPreferences: json['contentPreferences'] == null
          ? const ContentPreferences(downloadPreferences: DownloadPreferences())
          : ContentPreferences.fromJson(
              json['contentPreferences'] as Map<String, dynamic>),
      notificationPreferences: json['notificationPreferences'] == null
          ? const NotificationPreferences()
          : NotificationPreferences.fromJson(
              json['notificationPreferences'] as Map<String, dynamic>),
      playbackPreferences: json['playbackPreferences'] == null
          ? const PlaybackPreferences()
          : PlaybackPreferences.fromJson(
              json['playbackPreferences'] as Map<String, dynamic>),
      profilePicture: json['profilePicture'] as String? ?? '',
      username: json['username'] as String,
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'profilePicture': instance.profilePicture,
      'username': instance.username,
      'contentPreferences': instance.contentPreferences.toJson(),
      'notificationPreferences': instance.notificationPreferences.toJson(),
      'playbackPreferences': instance.playbackPreferences.toJson(),
    };
