import 'package:flutter/material.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/auth/view/login_view.dart';
import 'package:story_app/src/auth/view/register_view.dart';

enum ActivePage { login, register }

class AuthRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;
  final VoidCallback onAuthenticationSuccess;

  AuthRouterDelegate({
    required this.authRepository,
    required this.onAuthenticationSuccess,
  }) : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  ActivePage _activePage = ActivePage.login;

  _init() async {
    final isLoggedIn = await authRepository.isLoggedIn();
    if (isLoggedIn) {
      onAuthenticationSuccess();
    }
    notifyListeners();
  }

  List<Page> get authPages => [
        switch (_activePage) {
          ActivePage.login => MaterialPage(
              key: const ValueKey("LoginView"),
              child: LoginView(
                onSuccess: () {
                  onAuthenticationSuccess();
                  notifyListeners();
                },
                goToSignUp: () {
                  _activePage = ActivePage.register;
                  notifyListeners();
                },
              ),
            ),
          ActivePage.register => MaterialPage(
              key: const ValueKey("RegisterView"),
              child: RegisterView(
                goToLoginPage: () {
                  _activePage = ActivePage.login;
                  notifyListeners();
                },
              ),
            ),
        }
      ];

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: authPages,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);

        if (!didPop) {
          return false;
        }

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
