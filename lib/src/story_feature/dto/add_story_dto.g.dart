// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_story_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddStoryResponseImpl _$$AddStoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AddStoryResponseImpl(
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$AddStoryResponseImplToJson(
        _$AddStoryResponseImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
