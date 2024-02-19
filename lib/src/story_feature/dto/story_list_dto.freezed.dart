// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_list_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoryListRequest {
  int? get page => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryListRequestCopyWith<StoryListRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryListRequestCopyWith<$Res> {
  factory $StoryListRequestCopyWith(
          StoryListRequest value, $Res Function(StoryListRequest) then) =
      _$StoryListRequestCopyWithImpl<$Res, StoryListRequest>;
  @useResult
  $Res call({int? page, int? size, int? location});
}

/// @nodoc
class _$StoryListRequestCopyWithImpl<$Res, $Val extends StoryListRequest>
    implements $StoryListRequestCopyWith<$Res> {
  _$StoryListRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryListRequestImplCopyWith<$Res>
    implements $StoryListRequestCopyWith<$Res> {
  factory _$$StoryListRequestImplCopyWith(_$StoryListRequestImpl value,
          $Res Function(_$StoryListRequestImpl) then) =
      __$$StoryListRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? page, int? size, int? location});
}

/// @nodoc
class __$$StoryListRequestImplCopyWithImpl<$Res>
    extends _$StoryListRequestCopyWithImpl<$Res, _$StoryListRequestImpl>
    implements _$$StoryListRequestImplCopyWith<$Res> {
  __$$StoryListRequestImplCopyWithImpl(_$StoryListRequestImpl _value,
      $Res Function(_$StoryListRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? size = freezed,
    Object? location = freezed,
  }) {
    return _then(_$StoryListRequestImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$StoryListRequestImpl implements _StoryListRequest {
  const _$StoryListRequestImpl({this.page, this.size, this.location});

  @override
  final int? page;
  @override
  final int? size;
  @override
  final int? location;

  @override
  String toString() {
    return 'StoryListRequest(page: $page, size: $size, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryListRequestImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, page, size, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryListRequestImplCopyWith<_$StoryListRequestImpl> get copyWith =>
      __$$StoryListRequestImplCopyWithImpl<_$StoryListRequestImpl>(
          this, _$identity);
}

abstract class _StoryListRequest implements StoryListRequest {
  const factory _StoryListRequest(
      {final int? page,
      final int? size,
      final int? location}) = _$StoryListRequestImpl;

  @override
  int? get page;
  @override
  int? get size;
  @override
  int? get location;
  @override
  @JsonKey(ignore: true)
  _$$StoryListRequestImplCopyWith<_$StoryListRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoryListResponse _$StoryListResponseFromJson(Map<String, dynamic> json) {
  return _StoryListResponse.fromJson(json);
}

/// @nodoc
mixin _$StoryListResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'listStory')
  List<Story> get storyList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryListResponseCopyWith<StoryListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryListResponseCopyWith<$Res> {
  factory $StoryListResponseCopyWith(
          StoryListResponse value, $Res Function(StoryListResponse) then) =
      _$StoryListResponseCopyWithImpl<$Res, StoryListResponse>;
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'listStory') List<Story> storyList});
}

/// @nodoc
class _$StoryListResponseCopyWithImpl<$Res, $Val extends StoryListResponse>
    implements $StoryListResponseCopyWith<$Res> {
  _$StoryListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? storyList = null,
  }) {
    return _then(_value.copyWith(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      storyList: null == storyList
          ? _value.storyList
          : storyList // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoryListResponseImplCopyWith<$Res>
    implements $StoryListResponseCopyWith<$Res> {
  factory _$$StoryListResponseImplCopyWith(_$StoryListResponseImpl value,
          $Res Function(_$StoryListResponseImpl) then) =
      __$$StoryListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool error,
      String message,
      @JsonKey(name: 'listStory') List<Story> storyList});
}

/// @nodoc
class __$$StoryListResponseImplCopyWithImpl<$Res>
    extends _$StoryListResponseCopyWithImpl<$Res, _$StoryListResponseImpl>
    implements _$$StoryListResponseImplCopyWith<$Res> {
  __$$StoryListResponseImplCopyWithImpl(_$StoryListResponseImpl _value,
      $Res Function(_$StoryListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? storyList = null,
  }) {
    return _then(_$StoryListResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      storyList: null == storyList
          ? _value._storyList
          : storyList // ignore: cast_nullable_to_non_nullable
              as List<Story>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoryListResponseImpl implements _StoryListResponse {
  const _$StoryListResponseImpl(
      {required this.error,
      required this.message,
      @JsonKey(name: 'listStory') required final List<Story> storyList})
      : _storyList = storyList;

  factory _$StoryListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoryListResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<Story> _storyList;
  @override
  @JsonKey(name: 'listStory')
  List<Story> get storyList {
    if (_storyList is EqualUnmodifiableListView) return _storyList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_storyList);
  }

  @override
  String toString() {
    return 'StoryListResponse(error: $error, message: $message, storyList: $storyList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryListResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._storyList, _storyList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message,
      const DeepCollectionEquality().hash(_storyList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryListResponseImplCopyWith<_$StoryListResponseImpl> get copyWith =>
      __$$StoryListResponseImplCopyWithImpl<_$StoryListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoryListResponseImplToJson(
      this,
    );
  }
}

abstract class _StoryListResponse implements StoryListResponse {
  const factory _StoryListResponse(
          {required final bool error,
          required final String message,
          @JsonKey(name: 'listStory') required final List<Story> storyList}) =
      _$StoryListResponseImpl;

  factory _StoryListResponse.fromJson(Map<String, dynamic> json) =
      _$StoryListResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(name: 'listStory')
  List<Story> get storyList;
  @override
  @JsonKey(ignore: true)
  _$$StoryListResponseImplCopyWith<_$StoryListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
