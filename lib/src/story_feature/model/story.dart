import 'package:freezed_annotation/freezed_annotation.dart';

part 'story.g.dart';
part 'story.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story({
    required String id,
    required String name,
    required String description,
    required String photoUrl,
    required DateTime createdAt,
    double? lat,
    double? lon,
  }) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
