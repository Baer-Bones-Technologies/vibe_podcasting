import 'package:json_annotation/json_annotation.dart';

part 'notification_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class NotificationPreferences{
  NotificationPreferences({
   this.newEpisode = false,
   this.downloadComplete = false,
   this.inProgress = true,
});

  final bool downloadComplete;
  final bool inProgress;
  final bool newEpisode;

  factory NotificationPreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationPreferences(
      newEpisode: json['newEpisode'],
      downloadComplete: json['downloadComplete'],
      inProgress: json['inProgress'],
    );
  }

  Map<String, dynamic> toJson() => _$NotificationPreferencesToJson(
        this,
      );
}