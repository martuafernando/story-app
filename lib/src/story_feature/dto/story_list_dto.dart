import 'package:story_app/src/story_feature/model/story.dart';

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

class StoryListResponse {
  final bool error;
  final String message;
  final List<Story> storyList;

  StoryListResponse({
    required this.error,
    required this.message,
    required this.storyList,
  });

  factory StoryListResponse.fromJson(Map<String, dynamic> json) =>
      StoryListResponse(
        error: json["error"],
        message: json["message"],
        storyList: List<Story>.from(
            json["listStory"].map((x) => Story.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "listStory": List<dynamic>.from(storyList.map((x) => x.toJson())),
      };
}