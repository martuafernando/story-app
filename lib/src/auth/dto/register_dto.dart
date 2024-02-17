import 'package:json_annotation/json_annotation.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String name;
  final String email;
  final String password;

  RegisterRequest(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  final bool error;
  final String message;

  RegisterResponse({required this.error, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);
}
