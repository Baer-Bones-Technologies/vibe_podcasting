import 'package:json_annotation/json_annotation.dart';

part 'like.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Like{
  Like({
    required this.userId,
    required this.podcastId,
});

  final String userId;
  final String podcastId;

  factory Like.fromJson(
    Map<String, dynamic> json,
  ) {
    return Like(
      userId: json['userId'],
      podcastId: json['podcastId'],
    );
  }

  Map<String, dynamic> toJson() => _$LikeToJson(
        this,
      );
}