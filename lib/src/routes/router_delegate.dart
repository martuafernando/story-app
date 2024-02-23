import 'package:flutter/material.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/auth/auth_router_delegate.dart';
import 'package:story_app/src/settings/settings_provider.dart';
import 'package:story_app/src/story_feature/story_router_delegate.dart';

enum ActiveService { auth, story }

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  final AuthRepository authRepository;
  final SettingsProvider settingsController;

  late final AuthRouterDelegate authRouterDelegate;
  late final StoryRouterDelegate storyRouterDelegate;

  ActiveService activeService = ActiveService.auth;

  AppRouterDelegate._({
    required this.authRepository,
    required this.settingsController,
  }) : _navigatorKey = GlobalKey<NavigatorState>();

  factory AppRouterDelegate({
    required AuthRepository authrepository,
    required SettingsProvider settingsController,
  }) {
    var delegate = AppRouterDelegate._(
      authRepository: authrepository,
      settingsController: settingsController,
    );

    delegate.authRouterDelegate = AuthRouterDelegate(
      onAuthenticationSuccess: delegate.onAuthenticationSuccess,
      authRepository: authrepository,
    );

    delegate.storyRouterDelegate = StoryRouterDelegate(
      onSignOutHandler: delegate.onSignOut,
      settingsController: settingsController,
    );
    return delegate;
  }

  void onAuthenticationSuccess() {
    activeService = ActiveService.story;
    notifyListeners();
  }

  void onSignOut() {
    authRepository.signOut();
    activeService = ActiveService.auth;
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        switch (activeService) {
          ActiveService.auth => MaterialPage(
              child: Router(
                routerDelegate: authRouterDelegate,
                backButtonDispatcher: RootBackButtonDispatcher(),
              ),
            ),
          ActiveService.story => MaterialPage(
              child: Router(
                routerDelegate: storyRouterDelegate,
                backButtonDispatcher: RootBackButtonDispatcher(),
              ),
            ),
        },
      ],
      onPopPage: (route, result) {
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
