import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.g.dart';
part 'login_dto.freezed.dart';

@freezed
class LoginRequest with _$LoginRequest {
  const LoginRequest._();

  const factory LoginRequest({
    required String email,
    required String password,
  }) = _LoginRequest;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequest &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => Object.hash(email, password);
}

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required bool error,
    required String message,
    LoginResult? loginResult,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginResult with _$LoginResult {
  const factory LoginResult({
    required String userId,
    required String name,
    required String token,
  }) = _LoginResult;

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);
}
