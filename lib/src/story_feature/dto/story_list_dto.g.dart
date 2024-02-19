// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryListResponseImpl _$$StoryListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryListResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      storyList: (json['listStory'] as List<dynamic>)
          .map((e) => Story.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoryListResponseImplToJson(
        _$StoryListResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.storyList,
    };
