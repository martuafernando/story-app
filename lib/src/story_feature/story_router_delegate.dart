import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/src/settings/settings_provider.dart';
import 'package:story_app/src/settings/settings_view.dart';
import 'package:story_app/src/story_feature/provider/story_provider.dart';
import 'package:story_app/src/story_feature/view/add_story_view.dart';
import 'package:story_app/src/story_feature/view/story_details_view.dart';
import 'package:story_app/src/story_feature/view/story_list_view.dart';

class StoryRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  final VoidCallback onSignOutHandler;
  final SettingsProvider settingsController;

  StoryRouterDelegate({
    required this.onSignOutHandler,
    required this.settingsController,
  }) : _navigatorKey = GlobalKey<NavigatorState>();

  bool _isAddNewStory = false;
  bool _isSettingPage = false;
  String? _selectedStoryId;

  List<Page> get _pageStack => [
        MaterialPage(
          key: const ValueKey("StoryListView"),
          child: StoryListView(
            onTapped: (id) {
              _selectedStoryId = id;
              notifyListeners();
            },
            onSignOut: () {
              onSignOutHandler();
              notifyListeners();
            },
            goToAddStory: () {
              _isAddNewStory = true;
              notifyListeners();
            },
            goToSettingView: () {
              _isSettingPage = true;
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
        if (_isSettingPage)
          MaterialPage(
            key: const ValueKey("SettingView"),
            child: SettingsView(provider: settingsController),
          ),
      ];

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _pageStack,
      onPopPage: (route, result) {
        final didPop = route.didPop(result);

        if (!didPop) {
          return false;
        }

        Provider.of<StoryProvider>(context, listen: false).initialAllStory();

        _selectedStoryId = null;
        _isAddNewStory = false;
        _isSettingPage = false;
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
