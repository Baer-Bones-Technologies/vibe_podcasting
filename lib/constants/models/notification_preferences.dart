import 'package:json_annotation/json_annotation.dart';

part 'notification_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class NotificationPreferences{
  const NotificationPreferences({
   this.newEpisode = false,
   this.downloadComplete = false,
   this.inProgress = true,
});

  final bool downloadComplete;
  final bool inProgress;
  final bool newEpisode;

  factory NotificationPreferences.fromJson(
    Map<String, dynamic> json,
  ) => _$NotificationPreferencesFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$NotificationPreferencesToJson(
        this,
      );
}