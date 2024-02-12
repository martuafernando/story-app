import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/src/auth/dto/login_dto.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';
import 'package:story_app/src/data/api/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  final String _stateKey = "auth-token";

  const AuthRepository({
    required this.apiService,
  });

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return !(preferences.getString(_stateKey) == '' || preferences.getString(_stateKey) == null);
  }

  Future<bool> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(_stateKey, token);
  }

  Future<String> signIn(LoginRequest user) async {
    final LoginResponse response = await apiService.postLogin(user);

    if (response.loginResult?.token == null) {
      throw Exception('Login result is null');
    }

    return response.loginResult?.token as String;
  }

  Future<bool> register(RegisterRequest user) async {
    final RegisterResponse response = await apiService.postRegister(user);

    return !response.error;
  }

  Future<bool> signOut() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(_stateKey, '');
  }
}
