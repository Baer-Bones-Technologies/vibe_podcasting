// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      endTime: (json['endTime'] as num).toInt(),
      startTime: (json['startTime'] as num).toInt(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'title': instance.title,
    };
