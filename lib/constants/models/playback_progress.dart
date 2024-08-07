import 'package:json_annotation/json_annotation.dart';

part 'playback_progress.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class PlaybackProgress {
  PlaybackProgress({
    required this.currentPosition,
    required this.podcastId,
  });
  final int currentPosition;
  final String podcastId;

  factory PlaybackProgress.fromJson(
    Map<String, dynamic> json,
  ) => _$PlaybackProgressFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$PlaybackProgressToJson(
        this,
      );
}