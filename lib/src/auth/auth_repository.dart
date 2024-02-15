import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/src/auth/dto/login_dto.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';
import 'package:story_app/src/data/api/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  final String _stateKey = "auth-token";
  final String _stateExpKey = "auth-token-exp";

  const AuthRepository({
    required this.apiService,
  });

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    final expiredTime = preferences.getString(_stateExpKey);
    
    if (expiredTime == null || expiredTime == '') {
      return false;
    }

    final isExpired = DateTime.parse(preferences.getString(_stateExpKey)!)
        .isBefore(DateTime.now());

    if (isExpired) {
      preferences.setString(_stateKey, '');
      preferences.setString(_stateExpKey, '');
      return false;
    }

    log('TESTING:: ${preferences.getString(_stateKey)}');
    return !((preferences.getString(_stateKey) == '' ||
        preferences.getString(_stateKey) == null));
  }

  Future<bool> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return Future.wait([
      preferences.setString(_stateKey, token),
      preferences.setString(
          _stateExpKey, DateTime.now().add(const Duration(hours: 1)).toString())
    ]).then((value) => value.every((element) => element));
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final expiredTime = preferences.getString(_stateExpKey);
    if (expiredTime == null) {
      return null;
    }
    final isExpired = DateTime.parse(preferences.getString(_stateExpKey)!)
        .isBefore(DateTime.now());

    return isExpired ? null : preferences.getString(_stateKey);
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
    return Future.wait([
      preferences.setString(_stateKey, ''),
      preferences.setString(_stateExpKey, '')
    ]).then((value) => value.every((element) => element));
  }
}
