// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_story_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStoryResponse _$AddStoryResponseFromJson(Map<String, dynamic> json) =>
    AddStoryResponse(
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$AddStoryResponseToJson(AddStoryResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
