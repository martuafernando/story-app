import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.g.dart';
part 'register_dto.freezed.dart';

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required String name,
    required String email,
    required String password,
  }) = _RegisterRequest;
}

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required bool error,
    required String message,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}
