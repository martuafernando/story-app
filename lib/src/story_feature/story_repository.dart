import 'dart:developer';

import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/data/api/api_service.dart';
import 'package:story_app/src/story_feature/dto/story_detail_dto.dart';
import 'package:story_app/src/story_feature/dto/story_list_dto.dart';
import 'package:story_app/src/story_feature/model/story.dart';

class StoryRepository {
  final ApiService apiService;
  final AuthRepository authRepository;

  StoryRepository({required this.apiService, required this.authRepository});

  Future<List<Story>> getStoryList() async {
    final String? token = await authRepository.getToken();

    if (token == null) {
      return [];
    }

    final StoryListResponse response = await apiService.getStoryList(token);
    log(name: 'STORY_REPOSITORY::GET_STORY_LIST', response.toString());

    return response.storyList;
  }

  Future<Story?> getStoryDetail(String storyId) async {
    final String? token = await authRepository.getToken();

    if (token == null) {
      return null;
    }

    final StoryDetailResponse response = await apiService.getStoryDetail(token, storyId);
    log(name: 'STORY_REPOSITORY::GET_STORY_DETAIL', response.toString());

    return response.story;
  }
}