// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Like _$LikeFromJson(Map<String, dynamic> json) => Like(
      userId: json['userId'] as String,
      podcastId: json['podcastId'] as String,
    );

Map<String, dynamic> _$LikeToJson(Like instance) => <String, dynamic>{
      'userId': instance.userId,
      'podcastId': instance.podcastId,
    };
