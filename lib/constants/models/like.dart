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
  ) => _$LikeFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$LikeToJson(
        this,
      );
}