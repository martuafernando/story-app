import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_dto.g.dart';
part 'add_story_dto.freezed.dart';

@freezed
class AddStoryRequest with _$AddStoryRequest {
  const factory AddStoryRequest({
    required String description,
    required String photo,
    double? lat,
    double? lon,
  }) = _AddStoryRequest;
}

@freezed
class AddStoryResponse with _$AddStoryResponse {
  const factory AddStoryResponse({
    required bool error,
    required String message,
  }) = _AddStoryResponse;

  factory AddStoryResponse.fromJson(Map<String, dynamic> json) =>
      _$AddStoryResponseFromJson(json);
}
