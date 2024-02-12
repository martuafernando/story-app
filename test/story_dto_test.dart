import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/src/story_feature/dto/story_dto.dart';

void main() {
  group('Story response', () {
    test('should parsed correctly', () {
      // Arrange
      const registerResponse = {"error": false, "message": "User Created"};

      // Act
      final result = StoryResponse.fromJson(registerResponse);

      // Assert
      expect(result.error, false);
      expect(result.message, "User Created");
    });
  });
}
