import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'story_detail_dto.g.dart';

part 'story_detail_dto.freezed.dart';

@freezed
class StoryDetailResponse with _$StoryDetailResponse {
  const factory StoryDetailResponse({
    required bool error,
    required String message,
    required Story story,
  }) = _StoryDetailResponse;

  factory StoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailResponseFromJson(json);
}
