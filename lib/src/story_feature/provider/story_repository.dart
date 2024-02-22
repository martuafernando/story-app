import 'dart:developer';

import 'dart:typed_data';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:story_app/src/auth/auth_repository.dart';
import 'package:story_app/src/data/api/api_service.dart';
import 'package:story_app/src/story_feature/dto/add_story_dto.dart';
import 'package:story_app/src/story_feature/dto/story_detail_dto.dart';
import 'package:story_app/src/story_feature/dto/story_list_dto.dart';
import 'package:story_app/src/story_feature/model/story.dart';

class StoryRepository {
  final ApiService apiService;
  final AuthRepository authRepository;

  StoryRepository({required this.apiService, required this.authRepository});

  Future<List<Story>> getStoryList(int? page, int? size) async {
    final String? token = await authRepository.getToken();

    if (token == null) {
      return [];
    }

    final StoryListResponse response = await apiService.getStoryList(
      token: token,
      page: page,
      size: size,
    );
    log(
      name: 'STORY_REPOSITORY::GET_STORY_LIST',
      response.toString(),
    );

    return response.storyList;
  }

  Future<Story?> getStoryDetail(String storyId) async {
    final String? token = await authRepository.getToken();

    if (token == null) {
      return null;
    }

    final StoryDetailResponse response =
        await apiService.getStoryDetail(token, storyId);
    log(
      name: 'STORY_REPOSITORY::GET_STORY_DETAIL',
      response.toString(),
    );

    return response.story;
  }

  Future<AddStoryResponse> addStory(
    List<int> bytes,
    String fileName,
    String description,
    LatLng? location,
  ) async {
    final String? token = await authRepository.getToken();

    if (token == null) {
      throw Exception('Token is null');
    }

    final bytesCompressed = await compressImage(bytes);
    final response = await apiService.uploadStory(
      token,
      bytes: bytesCompressed,
      fileName: fileName,
      description: description,
      location: location,
    );

    log(
      name: 'STORY_REPOSITORY::ADD_STORY',
      response.toString(),
    );

    return response;
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(
      Uint8List.fromList(bytes),
    )!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];

    do {
      compressQuality -= 10;

      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );

      length = newByte.length;
    } while (length > 1000000);

    return newByte;
  }

  Future<List<int>> resizeImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;

    final img.Image image = img.decodeImage(
      Uint8List.fromList(bytes),
    )!;
    bool isWidthMoreTaller = image.width > image.height;
    int imageTall = isWidthMoreTaller ? image.width : image.height;
    double compressTall = 1;
    int length = imageLength;
    List<int> newByte = bytes;

    do {
      compressTall -= 0.1;

      final newImage = img.copyResize(
        image,
        width: isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
        height: !isWidthMoreTaller ? (imageTall * compressTall).toInt() : null,
      );

      length = newImage.length;
      if (length < 1000000) {
        newByte = img.encodeJpg(newImage);
      }
    } while (length > 1000000);

    return newByte;
  }
}
