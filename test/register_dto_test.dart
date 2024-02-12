import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';

void main() {
  group('Register response', () {
    test('should parsed correctly', () {
      // Arrange
      const registerResponse = {
        "error": false,
        "message": "User Created"
      };

      // Act
      final result = RegisterResponse.fromJson(registerResponse);

      // Assert
      expect(result.error, false);
      expect(result.message, "User Created");
    });
  });
}
