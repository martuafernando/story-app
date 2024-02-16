import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:story_app/src/auth/dto/login_dto.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';
import 'package:story_app/src/story_feature/dto/add_story_dto.dart';
import 'package:story_app/src/story_feature/dto/story_detail_dto.dart';
import 'package:story_app/src/story_feature/dto/story_list_dto.dart';

class ApiService {
  static const String _baseUrl = 'https://story-api.dicoding.dev/v1';

  Future<StoryListResponse> getStoryList(String token) async {
    final response = await http.get(Uri.parse("$_baseUrl/stories"), headers: {
      "Authorization": "Bearer $token",
    });
    log(
      name: 'API_SERVICE::GET_STORY_LIST',
      response.statusCode.toString(),
    );

    if (response.statusCode == 200) {
      return StoryListResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to get restaurant list');
    }
  }

  Future<StoryDetailResponse> getStoryDetail(
      String token, String storyId) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/stories/$storyId"), headers: {
      "Authorization": "Bearer $token",
    });
    log(
      name: 'API_SERVICE::GET_STORY_DETAIL',
      response.statusCode.toString(),
    );

    if (response.statusCode == 200) {
      return StoryDetailResponse.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to get restaurant list');
    }
  }

  Future<LoginResponse> postLogin(LoginRequest user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/login"),
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.body.isEmpty) {
      throw Exception('Response body is null or empty');
    }

    if (response.headers['content-type'] != 'application/json; charset=utf-8') {
      throw Exception('Invalid content-type');
    }

    final loginResponse = LoginResponse.fromJson(
      json.decode(response.body),
    );

    if (response.statusCode == 200) {
      return loginResponse;
    }

    throw Exception(loginResponse.message);
  }

  Future<RegisterResponse> postRegister(RegisterRequest user) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/register"),
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.body.isEmpty) {
      throw Exception('Response body is null or empty');
    }
    if (response.headers['content-type'] != 'application/json; charset=utf-8') {
      throw Exception('Invalid content-type');
    }

    final registerResponse = RegisterResponse.fromJson(
      json.decode(response.body),
    );

    if (response.statusCode == 201) {
      return registerResponse;
    }

    throw Exception(registerResponse.message);
  }

  Future<AddStoryResponse> uploadStory(
    String token, {
    required List<int> bytes,
    required String fileName,
    required String description,
  }) async {
    const String url = "$_baseUrl/stories";

    final uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    final multiPartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );
    final Map<String, String> fields = {
      "description": description,
    };
    final Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    log(
      name: 'API_SERVICE::UPLOAD_STORY',
      statusCode.toString(),
    );

    if (statusCode == 201) {
      final AddStoryResponse uploadResponse = AddStoryResponse.fromJson(
        json.decode(responseData),
      );
      return uploadResponse;
    } else {
      throw Exception("Upload file error");
    }
  }
}
