import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/src/story_feature/dto/story_detail_dto.dart';

void main() {
  group('Story Detail response', () {
    test('should parsed correctly', () {
      // Arrange
      const storyDetailResponse = {
        "error": false,
        "message": "Story fetched successfully",
        "story": {
          "id": "story-FvU4u0Vp2S3PMsFg",
          "name": "Dimas",
          "description": "Lorem Ipsum",
          "photoUrl":
              "https://story-api.dicoding.dev/images/stories/photos-1641623658595_dummy-pic.png",
          "createdAt": "2022-01-08T06:34:18.598Z",
          "lat": -10.212,
          "lon": -16.002
        }
      };

      // Act
      final result = StoryDetailResponse.fromJson(storyDetailResponse);

      // Assert
      expect(result.error, false);
      expect(result.message, "Story fetched successfully");
      expect(result.story.id, "story-FvU4u0Vp2S3PMsFg");
      expect(result.story.name, "Dimas");
      expect(result.story.description, "Lorem Ipsum");
      expect(result.story.photoUrl,
          "https://story-api.dicoding.dev/images/stories/photos-1641623658595_dummy-pic.png");
      expect(
        result.story.createdAt,
        DateTime.parse("2022-01-08T06:34:18.598Z"),
      );
      expect(result.story.lat, -10.212);
      expect(result.story.lon, -16.002);
    });
  });
}
