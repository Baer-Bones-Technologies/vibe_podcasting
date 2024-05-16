// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listening_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListeningHistory _$ListeningHistoryFromJson(Map<String, dynamic> json) =>
    ListeningHistory(
      completionStatus: CompletionStatus.fromJson(
          json['completionStatus'] as Map<String, dynamic>),
      lastPlayed: DateTime.parse(json['lastPlayed'] as String),
      podcastId: json['podcastId'] as String,
    );

Map<String, dynamic> _$ListeningHistoryToJson(ListeningHistory instance) =>
    <String, dynamic>{
      'completionStatus': instance.completionStatus.toJson(),
      'lastPlayed': instance.lastPlayed.toIso8601String(),
      'podcastId': instance.podcastId,
    };
