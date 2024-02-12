import 'package:flutter/material.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/auth/dto/login_dto.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  bool isLoading = false;
  bool isLoggedIn = false;
  String? message;

  Future<bool> signIn(LoginRequest user) async {
    isLoading = true;
    notifyListeners();

    try {
      final token = await authRepository.signIn(user);
      final result = authRepository.saveToken(token);

      isLoggedIn = true;
      isLoading = false;
      notifyListeners();

      return result;

    } catch (e) {
      isLoggedIn = false;
      isLoading = false;
      message = e.toString();
      message = message?.replaceFirst('Exception: ', '');

      notifyListeners();
      return false;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> register(RegisterRequest user) async {
    isLoading = true;
    notifyListeners();

    try {
      final result = await authRepository.register(user);

      isLoading = false;
      notifyListeners();

      return result;

    } catch (e) {
      isLoading = false;
      message = e.toString();
      message = message?.replaceFirst('Exception: ', '');

      notifyListeners();
      return false;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signOut() async {
    isLoading = true;
    notifyListeners();

    try {
      final isSignOut = await authRepository.signOut();

      isLoggedIn = true;
      isLoading = false;

      notifyListeners();
      return isSignOut;

    } catch (e) {
      isLoggedIn = false;
      isLoading = false;
      message = e.toString();
      message = message?.replaceFirst('Exception: ', '');

      notifyListeners();
      return false;

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void clearMessage() {
    message = null;
    notifyListeners();
  }
}
