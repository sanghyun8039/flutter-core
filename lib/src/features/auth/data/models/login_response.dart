import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required LoginData data,
    required int statusCode,
    required String message,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class LoginData with _$LoginData {
  const factory LoginData({required Admin admin, required Token token}) =
      _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class Admin with _$Admin {
  const factory Admin({
    required int id,
    required String name,
    required String adminId,
    required Authority authority,
  }) = _Admin;

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
}

@freezed
class Authority with _$Authority {
  const factory Authority({
    required String createdAt,
    required String updatedAt,
    required int id,
    required String name,
    required bool adminYn,
    required bool memberYn,
    required bool gateYn,
    required bool parkingStatusYn,
    required bool parkingHistoryYn,
    required bool cctvYn,
    required bool emergencyYn,
    required bool lightYn,
    required bool apartmentYn,
    required bool adminAppYn,
    required bool isMaster,
  }) = _Authority;

  factory Authority.fromJson(Map<String, dynamic> json) =>
      _$AuthorityFromJson(json);
}

@freezed
class Token with _$Token {
  const factory Token({
    required String accessToken,
    required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);
}
