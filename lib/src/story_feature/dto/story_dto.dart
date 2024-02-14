import 'dart:io';

class StoryRequest {
  final String description;
  final File photo;
  final double? lat;
  final double? lon;

  StoryRequest({
    required this.description,
    required this.photo,
    this.lat,
    this.lon,
  });
}

class StoryResponse {
  final bool error;
  final String message;

  StoryResponse({required this.error, required this.message});

  factory StoryResponse.fromJson(Map<String, dynamic> json) {
    return StoryResponse(
      error: json['error'],
      message: json['message'],
    );
  }
}
