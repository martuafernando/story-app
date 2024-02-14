import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/src/story_feature/dto/story_list_dto.dart';

void main() {
  group('Story List response', () {
    test('should parsed correctly', () {
      // Arrange
      const storyListResponse = {
        "error": false,
        "message": "Stories fetched successfully",
        "listStory": [
          {
            "id": "story-Asko3-WPRHlqBnIs",
            "name": "someone28",
            "description": "Lorem Ipsum",
            "photoUrl": "xxx",
            "createdAt": "2024-02-13T12:16:05.599Z",
            "lat": null,
            "lon": null
          },
        ]
      };

      // Act
      final result = StoryListResponse.fromJson(storyListResponse);

      // Assert
      expect(result.error, false);
      expect(result.message, "Stories fetched successfully");
      expect(result.storyList[0].id, "story-Asko3-WPRHlqBnIs");
      expect(result.storyList[0].name, "someone28");
      expect(result.storyList[0].description, "Lorem Ipsum");
      expect(result.storyList[0].photoUrl, "xxx");
      expect(
        result.storyList[0].createdAt,
        DateTime.parse("2024-02-13T12:16:05.599Z"),
      );
      expect(result.storyList[0].lat, null);
      expect(result.storyList[0].lon, null);
    });
  });
}
