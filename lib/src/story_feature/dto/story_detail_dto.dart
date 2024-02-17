import 'package:json_annotation/json_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'story_detail_dto.g.dart';

@JsonSerializable()
class StoryDetailResponse {
  final bool error;
  final String message;
  final Story story;

  StoryDetailResponse({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StoryDetailResponseToJson(this);
}
