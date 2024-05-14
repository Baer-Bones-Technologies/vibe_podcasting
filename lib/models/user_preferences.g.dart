// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    UserPreferences(
      birthday: DateTime.parse(json['birthday'] as String),
      age: (json['age'] as num).toInt(),
      contentPreferences: ContentPreferences.fromJson(
          json['contentPreferences'] as Map<String, dynamic>),
      downloadPreferences: DownloadPreferences.fromJson(
          json['downloadPreferences'] as Map<String, dynamic>),
      notificationPreferences: NotificationPreferences.fromJson(
          json['notificationPreferences'] as Map<String, dynamic>),
      playbackPreferences: PlaybackPreferences.fromJson(
          json['playbackPreferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserPreferencesToJson(UserPreferences instance) =>
    <String, dynamic>{
      'birthday': instance.birthday.toIso8601String(),
      'age': instance.age,
      'contentPreferences': instance.contentPreferences.toJson(),
      'downloadPreferences': instance.downloadPreferences.toJson(),
      'notificationPreferences': instance.notificationPreferences.toJson(),
      'playbackPreferences': instance.playbackPreferences.toJson(),
    };
