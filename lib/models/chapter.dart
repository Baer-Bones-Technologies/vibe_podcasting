import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Chapter {
  const Chapter({
    required this.endTime,
    required this.startTime,
    required this.title,
  });

  final int endTime;
  final int startTime;
  final String title;

  factory Chapter.fromJson(
    Map<String, dynamic> json,
  ) {
    return Chapter(
      endTime: json['endTime'],
      startTime: json['startTime'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => _$ChapterToJson(
        this,
      );
}
