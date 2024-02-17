import 'package:json_annotation/json_annotation.dart';
import 'package:story_app/src/story_feature/model/story.dart';

part 'story_list_dto.g.dart';
class StoryListRequest {
  final int? page;
  final int? size;
  final int? location;

  StoryListRequest({
    this.page,
    this.size,
    this.location,
  });
}

@JsonSerializable()
class StoryListResponse {
  final bool error;
  final String message;
  @JsonKey(name: 'listStory')
  final List<Story> storyList;

  StoryListResponse({
    required this.error,
    required this.message,
    required this.storyList,
  });

  factory StoryListResponse.fromJson(json) => _$StoryListResponseFromJson(json);
 
  Map<String, dynamic> toJson() => _$StoryListResponseToJson(this);
}
