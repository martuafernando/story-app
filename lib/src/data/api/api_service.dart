import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:story_app/src/auth/dto/login_dto.dart';
import 'package:story_app/src/auth/dto/register_dto.dart';
import 'package:story_app/src/story_feature/dto/story_list_dto.dart';

class ApiService {
  static const String _baseUrl = 'https://story-api.dicoding.dev/v1/';

  Future<StoryListResponse> getStoryList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));
    if (response.statusCode == 200) {
      return StoryListResponse.fromJson(json.decode(response.body));
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

    final loginResponse = LoginResponse.fromJson(json.decode(response.body));

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


    final registerResponse = RegisterResponse.fromJson(json.decode(response.body));

    if (response.statusCode == 201) {
      return registerResponse;
    }

    throw Exception(registerResponse.message);
  }
}
