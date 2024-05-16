// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaybackProgress _$PlaybackProgressFromJson(Map<String, dynamic> json) =>
    PlaybackProgress(
      currentPosition: (json['currentPosition'] as num).toInt(),
      podcastId: json['podcastId'] as String,
    );

Map<String, dynamic> _$PlaybackProgressToJson(PlaybackProgress instance) =>
    <String, dynamic>{
      'currentPosition': instance.currentPosition,
      'podcastId': instance.podcastId,
    };
