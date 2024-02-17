import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'add_story_dto.g.dart';

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

@JsonSerializable()
class AddStoryResponse {
  final bool error;
  final String message;

  AddStoryResponse({required this.error, required this.message});

  factory AddStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AddStoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddStoryResponseToJson(this);
}
