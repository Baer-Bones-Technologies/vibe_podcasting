// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPreferences _$NotificationPreferencesFromJson(
        Map<String, dynamic> json) =>
    NotificationPreferences(
      newEpisode: json['newEpisode'] as bool? ?? false,
      downloadComplete: json['downloadComplete'] as bool? ?? false,
      inProgress: json['inProgress'] as bool? ?? true,
    );

Map<String, dynamic> _$NotificationPreferencesToJson(
        NotificationPreferences instance) =>
    <String, dynamic>{
      'downloadComplete': instance.downloadComplete,
      'inProgress': instance.inProgress,
      'newEpisode': instance.newEpisode,
    };
