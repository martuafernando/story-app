import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginRequest &&
        other.email == email &&
        other.password == password;
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);

  @override
  int get hashCode => Object.hash(email, password);
}

@JsonSerializable()
class LoginResponse {
  final bool error;
  final String message;
  final LoginResult? loginResult;

  LoginResponse({
    required this.error,
    required this.message,
    this.loginResult,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginResult {
  final String userId;
  final String name;
  final String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
