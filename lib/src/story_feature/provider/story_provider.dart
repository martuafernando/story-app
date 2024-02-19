import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_app/src/story_feature/model/list_story_result_state.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/model/story_result_state.dart';
import 'package:story_app/src/story_feature/provider/story_repository.dart';

class StoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryProvider({required this.storyRepository}) {
    fetchAllStory();
  }

  late ListStoryResultState _listStoryResultstate = const ListStoryResultState.noData('Not initialized');
  late StoryResultState _storyResultState = const StoryResultState.noData('Not initialized');

  late List<Story> _storyList = [];
  late Story _story;
  String _message = '';

  String get message => _message;
  
  ListStoryResultState get listStoryResultState => _listStoryResultstate;
  StoryResultState get storyResultState => _storyResultState;

  List<Story> get storyList => _storyList;
  Story get story => _story;

  Future<void> fetchAllStory() async {
    try {
      _listStoryResultstate = const ListStoryResultState.loading();
      notifyListeners();

      final response = await storyRepository.getStoryList();
      log(
        name: 'STORY_PROVIDER::FETCH_ALL_STORY',
        response.toString(),
      );

      if (response.isEmpty) {
        _listStoryResultstate = ListStoryResultState.noData(message);
        notifyListeners();
        _message = 'Empty Data';
      }

      _listStoryResultstate = ListStoryResultState.hasData(response);
      notifyListeners();
      _storyList = response;
    } catch (e) {
      _listStoryResultstate = ListStoryResultState.error(e.toString());
      notifyListeners();
      log(
        name: 'STORY_PROVIDER::FETCH_ALL_STORY',
        e.toString(),
      );
      _message = 'Error --> $e';
    }
  }

  Future<void> fetchDetailStory(String storyId) async {
    try {
      _storyResultState = const StoryResultState.loading();
      Future.microtask(
        () => notifyListeners(),
      );

      final response = await storyRepository.getStoryDetail(storyId);
      log(
        name: 'STORY_PROVIDER::FETCH_STORY_DETAIL',
        response.toString(),
      );

      if (response == null) {
        _storyResultState = StoryResultState.noData(message);
        Future.microtask(
          () => notifyListeners(),
        );
        _message = 'Empty Data';
      }

      _storyResultState = StoryResultState.hasData(response!);
      _story = response;
      Future.microtask(
        () => notifyListeners(),
      );
    } catch (e) {
      _storyResultState = StoryResultState.error(e.toString());
      Future.microtask(
        () => notifyListeners(),
      );
      log(
        name: 'STORY_PROVIDER::FETCH_STORY_DETAIL',
        e.toString(),
      );
      _message = 'Error --> $e';
    }
  }
}
