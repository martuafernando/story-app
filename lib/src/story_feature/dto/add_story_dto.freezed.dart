// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_story_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddStoryRequest {
  String get description => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddStoryRequestCopyWith<AddStoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryRequestCopyWith<$Res> {
  factory $AddStoryRequestCopyWith(
          AddStoryRequest value, $Res Function(AddStoryRequest) then) =
      _$AddStoryRequestCopyWithImpl<$Res, AddStoryRequest>;
  @useResult
  $Res call({String description, String photo, double? lat, double? lon});
}

/// @nodoc
class _$AddStoryRequestCopyWithImpl<$Res, $Val extends AddStoryRequest>
    implements $AddStoryRequestCopyWith<$Res> {
  _$AddStoryRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryRequestImplCopyWith<$Res>
    implements $AddStoryRequestCopyWith<$Res> {
  factory _$$AddStoryRequestImplCopyWith(_$AddStoryRequestImpl value,
          $Res Function(_$AddStoryRequestImpl) then) =
      __$$AddStoryRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, String photo, double? lat, double? lon});
}

/// @nodoc
class __$$AddStoryRequestImplCopyWithImpl<$Res>
    extends _$AddStoryRequestCopyWithImpl<$Res, _$AddStoryRequestImpl>
    implements _$$AddStoryRequestImplCopyWith<$Res> {
  __$$AddStoryRequestImplCopyWithImpl(
      _$AddStoryRequestImpl _value, $Res Function(_$AddStoryRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? photo = null,
    Object? lat = freezed,
    Object? lon = freezed,
  }) {
    return _then(_$AddStoryRequestImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lon: freezed == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$AddStoryRequestImpl implements _AddStoryRequest {
  const _$AddStoryRequestImpl(
      {required this.description, required this.photo, this.lat, this.lon});

  @override
  final String description;
  @override
  final String photo;
  @override
  final double? lat;
  @override
  final double? lon;

  @override
  String toString() {
    return 'AddStoryRequest(description: $description, photo: $photo, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryRequestImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, photo, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryRequestImplCopyWith<_$AddStoryRequestImpl> get copyWith =>
      __$$AddStoryRequestImplCopyWithImpl<_$AddStoryRequestImpl>(
          this, _$identity);
}

abstract class _AddStoryRequest implements AddStoryRequest {
  const factory _AddStoryRequest(
      {required final String description,
      required final String photo,
      final double? lat,
      final double? lon}) = _$AddStoryRequestImpl;

  @override
  String get description;
  @override
  String get photo;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryRequestImplCopyWith<_$AddStoryRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddStoryResponse _$AddStoryResponseFromJson(Map<String, dynamic> json) {
  return _AddStoryResponse.fromJson(json);
}

/// @nodoc
mixin _$AddStoryResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddStoryResponseCopyWith<AddStoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoryResponseCopyWith<$Res> {
  factory $AddStoryResponseCopyWith(
          AddStoryResponse value, $Res Function(AddStoryResponse) then) =
      _$AddStoryResponseCopyWithImpl<$Res, AddStoryResponse>;
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class _$AddStoryResponseCopyWithImpl<$Res, $Val extends AddStoryResponse>
    implements $AddStoryResponseCopyWith<$Res> {
  _$AddStoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddStoryResponseImplCopyWith<$Res>
    implements $AddStoryResponseCopyWith<$Res> {
  factory _$$AddStoryResponseImplCopyWith(_$AddStoryResponseImpl value,
          $Res Function(_$AddStoryResponseImpl) then) =
      __$$AddStoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message});
}

/// @nodoc
class __$$AddStoryResponseImplCopyWithImpl<$Res>
    extends _$AddStoryResponseCopyWithImpl<$Res, _$AddStoryResponseImpl>
    implements _$$AddStoryResponseImplCopyWith<$Res> {
  __$$AddStoryResponseImplCopyWithImpl(_$AddStoryResponseImpl _value,
      $Res Function(_$AddStoryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
  }) {
    return _then(_$AddStoryResponseImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddStoryResponseImpl implements _AddStoryResponse {
  const _$AddStoryResponseImpl({required this.error, required this.message});

  factory _$AddStoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddStoryResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;

  @override
  String toString() {
    return 'AddStoryResponse(error: $error, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoryResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, error, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoryResponseImplCopyWith<_$AddStoryResponseImpl> get copyWith =>
      __$$AddStoryResponseImplCopyWithImpl<_$AddStoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddStoryResponseImplToJson(
      this,
    );
  }
}

abstract class _AddStoryResponse implements AddStoryResponse {
  const factory _AddStoryResponse(
      {required final bool error,
      required final String message}) = _$AddStoryResponseImpl;

  factory _AddStoryResponse.fromJson(Map<String, dynamic> json) =
      _$AddStoryResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$AddStoryResponseImplCopyWith<_$AddStoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
