// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryDetailResponseImpl _$$StoryDetailResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryDetailResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
      story: Story.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoryDetailResponseImplToJson(
        _$StoryDetailResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };
