import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/auth/login_view.dart';
import 'package:story_app/src/auth/register_view.dart';
import 'package:story_app/src/story_feature/add_story_view.dart';
import 'package:story_app/src/story_feature/story_details_view.dart';
import 'package:story_app/src/story_feature/story_list_view.dart';
import 'package:story_app/src/story_feature/story_provider.dart';

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
  bool _isAddNewStory = false;
  bool _isRegister = false;
  String? _selectedStoryId;

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
            ),
          ),
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
            ),
          ),
      ];

  List<Page> get _loggedInStack => [
        MaterialPage(
          key: const ValueKey("StoryListView"),
          child: StoryListView(
            onTapped: (id) {
              _selectedStoryId = id;
              notifyListeners();
            },
            onSignOut: () {
              _isLoggedIn = false;
              notifyListeners();
            },
            goToAddStory: () {
              _isAddNewStory = true;
              notifyListeners();
            },
            items: const [],
          ),
        ),
        if (_selectedStoryId != null)
          MaterialPage(
            key: const ValueKey("StoryDetailsView"),
            child: StoryDetailsView(
              storyId: _selectedStoryId!,
            ),
          ),
        if (_isAddNewStory)
          const MaterialPage(
            key: ValueKey("AddNewStoryView"),
            child: AddStoryView(),
          ),
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

        Provider.of<StoryProvider>(context, listen: false).fetchAllStory();

        _isRegister = false;
        _selectedStoryId = null;
        _isAddNewStory = false;
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
