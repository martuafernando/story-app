import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:story_app/src/story_feature/model/story.dart';
import 'package:story_app/src/story_feature/story_repository.dart';

enum ResultState { loading, noData, hasData, error }

class StoryProvider extends ChangeNotifier {
  final StoryRepository storyRepository;

  StoryProvider({required this.storyRepository}) {
    _fetchAllStory();
  }

  late ResultState _state;
  late List<Story> _storyList = [];
  String _message = '';

  String get message => _message;
  ResultState get state => _state;
  List<Story> get result => _storyList;

  Future<dynamic> _fetchAllStory() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final response = await storyRepository.getStoryList();
      log(name: 'STORY_PROVIDER::FETCH_ALL_STORY', response.toString());

      if (response.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      }

      _state = ResultState.hasData;
      notifyListeners();
      return _storyList = response;
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      log(name: 'STORY_PROVIDER::FETCH_ALL_STORY', e.toString());
      return _message = 'Error --> $e';
    }
  }
}
