// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackPreferences _$PlaybackPreferencesFromJson(Map<String, dynamic> json) =>
    PlaybackPreferences(
      audioSpeed: (json['audioSpeed'] as num?)?.toDouble() ?? 1.0,
      autoPlayNext: json['autoPlayNext'] as bool? ?? false,
      dataSaverMode: json['dataSaverMode'] as bool? ?? false,
      sleepTimer: (json['sleepTimer'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PlaybackPreferencesToJson(
        PlaybackPreferences instance) =>
    <String, dynamic>{
      'audioSpeed': instance.audioSpeed,
      'autoPlayNext': instance.autoPlayNext,
      'dataSaverMode': instance.dataSaverMode,
      'sleepTimer': instance.sleepTimer,
    };
