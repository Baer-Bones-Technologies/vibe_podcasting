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
  ) {
    return Comment(
      commentText: json['commentText'],
      timeStamp: json['timeStamp'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() => _$CommentToJson(
        this,
      );
}
