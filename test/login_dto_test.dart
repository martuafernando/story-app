import 'package:flutter_test/flutter_test.dart';
import 'package:story_app/src/auth/dto/login_dto.dart';

void main() {
  group('Login response', () {
    test('should parsed correctly', () {
      // Arrange
      const loginResponse = {
        "error": false,
        "message": "success",
        "loginResult": {
          "userId": "user-yj5pc_LARC_AgK61",
          "name": "Arif Faizin",
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJ1c2VyLXlqNXBjX0xBUkNfQWdLNjEiLCJpYXQiOjE2NDE3OTk5NDl9.flEMaQ7zsdYkxuyGbiXjEDXO8kuDTcI__3UjCwt6R_I"
        }
      };

      // Act
      final result = LoginResponse.fromJson(loginResponse);

      // Assert
      expect(result.error, false);
      expect(result.message, "success");
      expect(result.loginResult?.userId, "user-yj5pc_LARC_AgK61");
      expect(result.loginResult?.name, "Arif Faizin");
      expect(result.loginResult?.token,
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJ1c2VyLXlqNXBjX0xBUkNfQWdLNjEiLCJpYXQiOjE2NDE3OTk5NDl9.flEMaQ7zsdYkxuyGbiXjEDXO8kuDTcI__3UjCwt6R_I");
    });
  });
}
