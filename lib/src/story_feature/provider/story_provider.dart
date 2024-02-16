import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/provider/story_repository.dart';

enum ResultState { loading, noData, hasData, error }

class StoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryProvider({required this.storyRepository}) {
    fetchAllStory();
  }

  late ResultState _state;
  late List<Story> _storyList = [];
  late Story _story;
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  List<Story> get storyList => _storyList;
  Story get story => _story;

  Future<void> fetchAllStory() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final response = await storyRepository.getStoryList();
      log(
        name: 'STORY_PROVIDER::FETCH_ALL_STORY',
        response.toString(),
      );

      if (response.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        _message = 'Empty Data';
      }

      _state = ResultState.hasData;
      notifyListeners();
      _storyList = response;
    } catch (e) {
      _state = ResultState.error;
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
      _state = ResultState.loading;
      Future.microtask(
        () => notifyListeners(),
      );

      final response = await storyRepository.getStoryDetail(storyId);
      log(
        name: 'STORY_PROVIDER::FETCH_STORY_DETAIL',
        response.toString(),
      );

      if (response == null) {
        _state = ResultState.noData;
        Future.microtask(
          () => notifyListeners(),
        );
        _message = 'Empty Data';
      }

      _state = ResultState.hasData;
      _story = response!;
      Future.microtask(
        () => notifyListeners(),
      );
    } catch (e) {
      _state = ResultState.error;
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
