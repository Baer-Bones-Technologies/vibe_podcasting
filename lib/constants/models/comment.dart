import 'package:json_annotation/json_annotation.dart';

import 'vibe_user.dart';

part 'comment.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Comment {
  const Comment({
    required this.commentText,
    required this.timeStamp,
    required this.user,
  });

  final String commentText;
  final DateTime timeStamp;
  final VibeUser user;

  factory Comment.fromJson(
    Map<String, dynamic> json,
  ) => _$CommentFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$CommentToJson(
        this,
      );
}
