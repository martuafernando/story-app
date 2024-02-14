import 'dart:convert';

import 'package:story_app/src/story_feature/model/story.dart';

String storyDetailResponseToJson(StoryDetailResponse data) => json.encode(
      data.toJson(),
    );

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
      StoryDetailResponse(
        error: json["error"],
        message: json["message"],
        story: Story.fromJson(json["story"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "story": story.toJson(),
      };
}
