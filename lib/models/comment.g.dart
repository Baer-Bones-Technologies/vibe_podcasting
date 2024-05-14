// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      commentText: json['commentText'] as String,
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      user: VibeUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'commentText': instance.commentText,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'user': instance.user.toJson(),
    };
