// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'message': instance.message,
    };

_$LoginDataImpl _$$LoginDataImplFromJson(Map<String, dynamic> json) =>
    _$LoginDataImpl(
      admin: Admin.fromJson(json['admin'] as Map<String, dynamic>),
      token: Token.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginDataImplToJson(_$LoginDataImpl instance) =>
    <String, dynamic>{
      'admin': instance.admin,
      'token': instance.token,
    };

_$AdminImpl _$$AdminImplFromJson(Map<String, dynamic> json) => _$AdminImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      adminId: json['adminId'] as String,
      authority: Authority.fromJson(json['authority'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AdminImplToJson(_$AdminImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adminId': instance.adminId,
      'authority': instance.authority,
    };

_$AuthorityImpl _$$AuthorityImplFromJson(Map<String, dynamic> json) =>
    _$AuthorityImpl(
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      adminYn: json['adminYn'] as bool,
      memberYn: json['memberYn'] as bool,
      gateYn: json['gateYn'] as bool,
      parkingStatusYn: json['parkingStatusYn'] as bool,
      parkingHistoryYn: json['parkingHistoryYn'] as bool,
      cctvYn: json['cctvYn'] as bool,
      emergencyYn: json['emergencyYn'] as bool,
      lightYn: json['lightYn'] as bool,
      apartmentYn: json['apartmentYn'] as bool,
      adminAppYn: json['adminAppYn'] as bool,
      isMaster: json['isMaster'] as bool,
    );

Map<String, dynamic> _$$AuthorityImplToJson(_$AuthorityImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'name': instance.name,
      'adminYn': instance.adminYn,
      'memberYn': instance.memberYn,
      'gateYn': instance.gateYn,
      'parkingStatusYn': instance.parkingStatusYn,
      'parkingHistoryYn': instance.parkingHistoryYn,
      'cctvYn': instance.cctvYn,
      'emergencyYn': instance.emergencyYn,
      'lightYn': instance.lightYn,
      'apartmentYn': instance.apartmentYn,
      'adminAppYn': instance.adminAppYn,
      'isMaster': instance.isMaster,
    };

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
