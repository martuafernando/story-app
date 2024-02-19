// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'story_list_dto.g.dart';
part 'story_list_dto.freezed.dart';

@freezed
class StoryListRequest with _$StoryListRequest {
  const factory StoryListRequest({
    int? page,
    int? size,
    int? location,
  }) = _StoryListRequest;
}

@freezed
class StoryListResponse with _$StoryListResponse {
  const factory StoryListResponse({
    required bool error,
    required String message,
    @JsonKey(name: 'listStory') required List<Story> storyList,
  }) = _StoryListResponse;

  factory StoryListResponse.fromJson(json) => _$StoryListResponseFromJson(json);
}
