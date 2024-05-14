import 'package:json_annotation/json_annotation.dart';

import '../domain/completion_status.dart';

part 'listening_history.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class ListeningHistory{
  ListeningHistory({
    required this.completionStatus,
    required this.lastPlayed,
    required this.podcastId,
});

  CompletionStatus completionStatus;
  DateTime lastPlayed;
  String podcastId;

  factory ListeningHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return ListeningHistory(
      completionStatus: CompletionStatus.fromJson(json['completionStatus']),
      lastPlayed: json['lastPlayed'],
      podcastId: json['podcastId'],
    );
  }

  Map<String, dynamic> toJson() => _$ListeningHistoryToJson(
        this,
      );
}