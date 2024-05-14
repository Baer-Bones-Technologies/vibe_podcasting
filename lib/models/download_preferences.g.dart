// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DownloadPreferences _$DownloadPreferencesFromJson(Map<String, dynamic> json) =>
    DownloadPreferences(
      automaticDownloads: json['automaticDownloads'] as bool? ?? false,
      overWifiOnly: json['overWifiOnly'] as bool? ?? true,
      storageLimit: (json['storageLimit'] as num?)?.toInt() ?? 2,
    );

Map<String, dynamic> _$DownloadPreferencesToJson(
        DownloadPreferences instance) =>
    <String, dynamic>{
      'overWifiOnly': instance.overWifiOnly,
      'automaticDownloads': instance.automaticDownloads,
      'storageLimit': instance.storageLimit,
    };
