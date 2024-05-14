import 'package:json_annotation/json_annotation.dart';

part 'download_preferences.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class DownloadPreferences{
  DownloadPreferences({
  this.automaticDownloads = false,
  this.overWifiOnly = true,
  this.storageLimit = 2,
});

  final bool overWifiOnly;
  final bool automaticDownloads;
  final int storageLimit;

  factory DownloadPreferences.fromJson(
    Map<String, dynamic> json,
  ) {
    return DownloadPreferences(
      automaticDownloads: json['automaticDownloads'],
      overWifiOnly: json['overWifiOnly'],
      storageLimit: json['storageLimit'],
    );
  }

  Map<String, dynamic> toJson() => _$DownloadPreferencesToJson(
        this,
      );
}