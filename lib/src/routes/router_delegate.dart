import 'package:flutter/material.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/auth/login_view.dart';
import 'package:story_app/src/auth/register_view.dart';
import 'package:story_app/src/story_feature/story_list_view.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository authRepository;

  AppRouterDelegate(this.authRepository)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    _init();
  }

  List<Page> _historyStack = [];
  bool _isLoggedIn = false;
  bool _isRegister = false;

  _init() async {
    _isLoggedIn = await authRepository.isLoggedIn();
    notifyListeners();
  }

  List<Page> get authPages => [
        if (!_isRegister)
          MaterialPage(
              key: const ValueKey("LoginView"),
              child: LoginView(
                goToHomePage: () {
                  _isLoggedIn = true;
                  notifyListeners();
                },
                goToSignUp: () {
                  _isRegister = true;
                  notifyListeners();
                },
              )),
        if (_isRegister)
          MaterialPage(
              key: const ValueKey("RegisterView"),
              child: RegisterView(
                goToLoginPage: () {
                  Future.microtask(() {
                    _isRegister = false;
                    notifyListeners();
                  });
                },
              )),
      ];

  List<Page> get _loggedInStack => [
        if (!_isRegister)
          MaterialPage(
              key: const ValueKey("StoryListView"),
              child: StoryListView(
                onSignOut: () {
                  _isLoggedIn = false;
                  notifyListeners();
                },
                items: const [],
              )),
      ];

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn == false) {
      _historyStack = authPages;
    } else {
      _historyStack = _loggedInStack;
    }

    return Navigator(
      key: navigatorKey,
      pages: _historyStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        _isRegister = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
