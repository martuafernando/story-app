// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryListResponse _$StoryListResponseFromJson(Map<String, dynamic> json) =>
    StoryListResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
      storyList: (json['listStory'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoryListResponseToJson(StoryListResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.storyList,
    };
