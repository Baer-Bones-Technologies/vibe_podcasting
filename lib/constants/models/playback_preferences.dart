import 'package:json_annotation/json_annotation.dart';

part 'playback_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class PlaybackPreferences{
  const PlaybackPreferences({
   this.audioSpeed = 1.0,
   this.autoPlayNext = false,
   this.dataSaverMode = false,
   this.sleepTimer = 0,
});
  final double audioSpeed;
  final bool autoPlayNext;
  final bool dataSaverMode;
  final int? sleepTimer;

  factory PlaybackPreferences.fromJson(
    Map<String, dynamic> json,
  ) => _$PlaybackPreferencesFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$PlaybackPreferencesToJson(
        this,
      );
}