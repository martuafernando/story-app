import 'dart:io';

class AddStoryRequest {
  final String description;
  final File photo;
  final double? lat;
  final double? lon;

  AddStoryRequest({
    required this.description,
    required this.photo,
    this.lat,
    this.lon,
  });
}

class AddStoryResponse {
  final bool error;
  final String message;

  AddStoryResponse({required this.error, required this.message});

  factory AddStoryResponse.fromJson(Map<String, dynamic> json) {
    return AddStoryResponse(
      error: json['error'],
      message: json['message'],
    );
  }
}
