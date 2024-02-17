// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryDetailResponse _$StoryDetailResponseFromJson(Map<String, dynamic> json) =>
    StoryDetailResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: Story.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryDetailResponseToJson(
        StoryDetailResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };
