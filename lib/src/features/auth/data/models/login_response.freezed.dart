// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  LoginData get data => throw _privateConstructorUsedError;
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call({LoginData data, int statusCode, String message});

  $LoginDataCopyWith<$Res> get data;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoginDataCopyWith<$Res> get data {
    return $LoginDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginData data, int statusCode, String message});

  @override
  $LoginDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? statusCode = null,
    Object? message = null,
  }) {
    return _then(_$LoginResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as LoginData,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.data, required this.statusCode, required this.message});

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final LoginData data;
  @override
  final int statusCode;
  @override
  final String message;

  @override
  String toString() {
    return 'LoginResponse(data: $data, statusCode: $statusCode, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, statusCode, message);

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final LoginData data,
      required final int statusCode,
      required final String message}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  LoginData get data;
  @override
  int get statusCode;
  @override
  String get message;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LoginData _$LoginDataFromJson(Map<String, dynamic> json) {
  return _LoginData.fromJson(json);
}

/// @nodoc
mixin _$LoginData {
  Admin get admin => throw _privateConstructorUsedError;
  Token get token => throw _privateConstructorUsedError;

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginDataCopyWith<LoginData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataCopyWith<$Res> {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) then) =
      _$LoginDataCopyWithImpl<$Res, LoginData>;
  @useResult
  $Res call({Admin admin, Token token});

  $AdminCopyWith<$Res> get admin;
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$LoginDataCopyWithImpl<$Res, $Val extends LoginData>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admin = null,
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as Admin,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
    ) as $Val);
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminCopyWith<$Res> get admin {
    return $AdminCopyWith<$Res>(_value.admin, (value) {
      return _then(_value.copyWith(admin: value) as $Val);
    });
  }

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDataImplCopyWith<$Res>
    implements $LoginDataCopyWith<$Res> {
  factory _$$LoginDataImplCopyWith(
          _$LoginDataImpl value, $Res Function(_$LoginDataImpl) then) =
      __$$LoginDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Admin admin, Token token});

  @override
  $AdminCopyWith<$Res> get admin;
  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$$LoginDataImplCopyWithImpl<$Res>
    extends _$LoginDataCopyWithImpl<$Res, _$LoginDataImpl>
    implements _$$LoginDataImplCopyWith<$Res> {
  __$$LoginDataImplCopyWithImpl(
      _$LoginDataImpl _value, $Res Function(_$LoginDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? admin = null,
    Object? token = null,
  }) {
    return _then(_$LoginDataImpl(
      admin: null == admin
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as Admin,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataImpl implements _LoginData {
  const _$LoginDataImpl({required this.admin, required this.token});

  factory _$LoginDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataImplFromJson(json);

  @override
  final Admin admin;
  @override
  final Token token;

  @override
  String toString() {
    return 'LoginData(admin: $admin, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataImpl &&
            (identical(other.admin, admin) || other.admin == admin) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, admin, token);

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      __$$LoginDataImplCopyWithImpl<_$LoginDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataImplToJson(
      this,
    );
  }
}

abstract class _LoginData implements LoginData {
  const factory _LoginData(
      {required final Admin admin,
      required final Token token}) = _$LoginDataImpl;

  factory _LoginData.fromJson(Map<String, dynamic> json) =
      _$LoginDataImpl.fromJson;

  @override
  Admin get admin;
  @override
  Token get token;

  /// Create a copy of LoginData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataImplCopyWith<_$LoginDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Admin _$AdminFromJson(Map<String, dynamic> json) {
  return _Admin.fromJson(json);
}

/// @nodoc
mixin _$Admin {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get adminId => throw _privateConstructorUsedError;
  Authority get authority => throw _privateConstructorUsedError;

  /// Serializes this Admin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminCopyWith<Admin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminCopyWith<$Res> {
  factory $AdminCopyWith(Admin value, $Res Function(Admin) then) =
      _$AdminCopyWithImpl<$Res, Admin>;
  @useResult
  $Res call({int id, String name, String adminId, Authority authority});

  $AuthorityCopyWith<$Res> get authority;
}

/// @nodoc
class _$AdminCopyWithImpl<$Res, $Val extends Admin>
    implements $AdminCopyWith<$Res> {
  _$AdminCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adminId = null,
    Object? authority = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      authority: null == authority
          ? _value.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as Authority,
    ) as $Val);
  }

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthorityCopyWith<$Res> get authority {
    return $AuthorityCopyWith<$Res>(_value.authority, (value) {
      return _then(_value.copyWith(authority: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AdminImplCopyWith<$Res> implements $AdminCopyWith<$Res> {
  factory _$$AdminImplCopyWith(
          _$AdminImpl value, $Res Function(_$AdminImpl) then) =
      __$$AdminImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String adminId, Authority authority});

  @override
  $AuthorityCopyWith<$Res> get authority;
}

/// @nodoc
class __$$AdminImplCopyWithImpl<$Res>
    extends _$AdminCopyWithImpl<$Res, _$AdminImpl>
    implements _$$AdminImplCopyWith<$Res> {
  __$$AdminImplCopyWithImpl(
      _$AdminImpl _value, $Res Function(_$AdminImpl) _then)
      : super(_value, _then);

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adminId = null,
    Object? authority = null,
  }) {
    return _then(_$AdminImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adminId: null == adminId
          ? _value.adminId
          : adminId // ignore: cast_nullable_to_non_nullable
              as String,
      authority: null == authority
          ? _value.authority
          : authority // ignore: cast_nullable_to_non_nullable
              as Authority,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminImpl implements _Admin {
  const _$AdminImpl(
      {required this.id,
      required this.name,
      required this.adminId,
      required this.authority});

  factory _$AdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String adminId;
  @override
  final Authority authority;

  @override
  String toString() {
    return 'Admin(id: $id, name: $name, adminId: $adminId, authority: $authority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adminId, adminId) || other.adminId == adminId) &&
            (identical(other.authority, authority) ||
                other.authority == authority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, adminId, authority);

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      __$$AdminImplCopyWithImpl<_$AdminImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminImplToJson(
      this,
    );
  }
}

abstract class _Admin implements Admin {
  const factory _Admin(
      {required final int id,
      required final String name,
      required final String adminId,
      required final Authority authority}) = _$AdminImpl;

  factory _Admin.fromJson(Map<String, dynamic> json) = _$AdminImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get adminId;
  @override
  Authority get authority;

  /// Create a copy of Admin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminImplCopyWith<_$AdminImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Authority _$AuthorityFromJson(Map<String, dynamic> json) {
  return _Authority.fromJson(json);
}

/// @nodoc
mixin _$Authority {
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get adminYn => throw _privateConstructorUsedError;
  bool get memberYn => throw _privateConstructorUsedError;
  bool get gateYn => throw _privateConstructorUsedError;
  bool get parkingStatusYn => throw _privateConstructorUsedError;
  bool get parkingHistoryYn => throw _privateConstructorUsedError;
  bool get cctvYn => throw _privateConstructorUsedError;
  bool get emergencyYn => throw _privateConstructorUsedError;
  bool get lightYn => throw _privateConstructorUsedError;
  bool get apartmentYn => throw _privateConstructorUsedError;
  bool get adminAppYn => throw _privateConstructorUsedError;
  bool get isMaster => throw _privateConstructorUsedError;

  /// Serializes this Authority to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Authority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorityCopyWith<Authority> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorityCopyWith<$Res> {
  factory $AuthorityCopyWith(Authority value, $Res Function(Authority) then) =
      _$AuthorityCopyWithImpl<$Res, Authority>;
  @useResult
  $Res call(
      {String createdAt,
      String updatedAt,
      int id,
      String name,
      bool adminYn,
      bool memberYn,
      bool gateYn,
      bool parkingStatusYn,
      bool parkingHistoryYn,
      bool cctvYn,
      bool emergencyYn,
      bool lightYn,
      bool apartmentYn,
      bool adminAppYn,
      bool isMaster});
}

/// @nodoc
class _$AuthorityCopyWithImpl<$Res, $Val extends Authority>
    implements $AuthorityCopyWith<$Res> {
  _$AuthorityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Authority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? name = null,
    Object? adminYn = null,
    Object? memberYn = null,
    Object? gateYn = null,
    Object? parkingStatusYn = null,
    Object? parkingHistoryYn = null,
    Object? cctvYn = null,
    Object? emergencyYn = null,
    Object? lightYn = null,
    Object? apartmentYn = null,
    Object? adminAppYn = null,
    Object? isMaster = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adminYn: null == adminYn
          ? _value.adminYn
          : adminYn // ignore: cast_nullable_to_non_nullable
              as bool,
      memberYn: null == memberYn
          ? _value.memberYn
          : memberYn // ignore: cast_nullable_to_non_nullable
              as bool,
      gateYn: null == gateYn
          ? _value.gateYn
          : gateYn // ignore: cast_nullable_to_non_nullable
              as bool,
      parkingStatusYn: null == parkingStatusYn
          ? _value.parkingStatusYn
          : parkingStatusYn // ignore: cast_nullable_to_non_nullable
              as bool,
      parkingHistoryYn: null == parkingHistoryYn
          ? _value.parkingHistoryYn
          : parkingHistoryYn // ignore: cast_nullable_to_non_nullable
              as bool,
      cctvYn: null == cctvYn
          ? _value.cctvYn
          : cctvYn // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyYn: null == emergencyYn
          ? _value.emergencyYn
          : emergencyYn // ignore: cast_nullable_to_non_nullable
              as bool,
      lightYn: null == lightYn
          ? _value.lightYn
          : lightYn // ignore: cast_nullable_to_non_nullable
              as bool,
      apartmentYn: null == apartmentYn
          ? _value.apartmentYn
          : apartmentYn // ignore: cast_nullable_to_non_nullable
              as bool,
      adminAppYn: null == adminAppYn
          ? _value.adminAppYn
          : adminAppYn // ignore: cast_nullable_to_non_nullable
              as bool,
      isMaster: null == isMaster
          ? _value.isMaster
          : isMaster // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorityImplCopyWith<$Res>
    implements $AuthorityCopyWith<$Res> {
  factory _$$AuthorityImplCopyWith(
          _$AuthorityImpl value, $Res Function(_$AuthorityImpl) then) =
      __$$AuthorityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String createdAt,
      String updatedAt,
      int id,
      String name,
      bool adminYn,
      bool memberYn,
      bool gateYn,
      bool parkingStatusYn,
      bool parkingHistoryYn,
      bool cctvYn,
      bool emergencyYn,
      bool lightYn,
      bool apartmentYn,
      bool adminAppYn,
      bool isMaster});
}

/// @nodoc
class __$$AuthorityImplCopyWithImpl<$Res>
    extends _$AuthorityCopyWithImpl<$Res, _$AuthorityImpl>
    implements _$$AuthorityImplCopyWith<$Res> {
  __$$AuthorityImplCopyWithImpl(
      _$AuthorityImpl _value, $Res Function(_$AuthorityImpl) _then)
      : super(_value, _then);

  /// Create a copy of Authority
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? name = null,
    Object? adminYn = null,
    Object? memberYn = null,
    Object? gateYn = null,
    Object? parkingStatusYn = null,
    Object? parkingHistoryYn = null,
    Object? cctvYn = null,
    Object? emergencyYn = null,
    Object? lightYn = null,
    Object? apartmentYn = null,
    Object? adminAppYn = null,
    Object? isMaster = null,
  }) {
    return _then(_$AuthorityImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      adminYn: null == adminYn
          ? _value.adminYn
          : adminYn // ignore: cast_nullable_to_non_nullable
              as bool,
      memberYn: null == memberYn
          ? _value.memberYn
          : memberYn // ignore: cast_nullable_to_non_nullable
              as bool,
      gateYn: null == gateYn
          ? _value.gateYn
          : gateYn // ignore: cast_nullable_to_non_nullable
              as bool,
      parkingStatusYn: null == parkingStatusYn
          ? _value.parkingStatusYn
          : parkingStatusYn // ignore: cast_nullable_to_non_nullable
              as bool,
      parkingHistoryYn: null == parkingHistoryYn
          ? _value.parkingHistoryYn
          : parkingHistoryYn // ignore: cast_nullable_to_non_nullable
              as bool,
      cctvYn: null == cctvYn
          ? _value.cctvYn
          : cctvYn // ignore: cast_nullable_to_non_nullable
              as bool,
      emergencyYn: null == emergencyYn
          ? _value.emergencyYn
          : emergencyYn // ignore: cast_nullable_to_non_nullable
              as bool,
      lightYn: null == lightYn
          ? _value.lightYn
          : lightYn // ignore: cast_nullable_to_non_nullable
              as bool,
      apartmentYn: null == apartmentYn
          ? _value.apartmentYn
          : apartmentYn // ignore: cast_nullable_to_non_nullable
              as bool,
      adminAppYn: null == adminAppYn
          ? _value.adminAppYn
          : adminAppYn // ignore: cast_nullable_to_non_nullable
              as bool,
      isMaster: null == isMaster
          ? _value.isMaster
          : isMaster // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorityImpl implements _Authority {
  const _$AuthorityImpl(
      {required this.createdAt,
      required this.updatedAt,
      required this.id,
      required this.name,
      required this.adminYn,
      required this.memberYn,
      required this.gateYn,
      required this.parkingStatusYn,
      required this.parkingHistoryYn,
      required this.cctvYn,
      required this.emergencyYn,
      required this.lightYn,
      required this.apartmentYn,
      required this.adminAppYn,
      required this.isMaster});

  factory _$AuthorityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorityImplFromJson(json);

  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  final int id;
  @override
  final String name;
  @override
  final bool adminYn;
  @override
  final bool memberYn;
  @override
  final bool gateYn;
  @override
  final bool parkingStatusYn;
  @override
  final bool parkingHistoryYn;
  @override
  final bool cctvYn;
  @override
  final bool emergencyYn;
  @override
  final bool lightYn;
  @override
  final bool apartmentYn;
  @override
  final bool adminAppYn;
  @override
  final bool isMaster;

  @override
  String toString() {
    return 'Authority(createdAt: $createdAt, updatedAt: $updatedAt, id: $id, name: $name, adminYn: $adminYn, memberYn: $memberYn, gateYn: $gateYn, parkingStatusYn: $parkingStatusYn, parkingHistoryYn: $parkingHistoryYn, cctvYn: $cctvYn, emergencyYn: $emergencyYn, lightYn: $lightYn, apartmentYn: $apartmentYn, adminAppYn: $adminAppYn, isMaster: $isMaster)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorityImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adminYn, adminYn) || other.adminYn == adminYn) &&
            (identical(other.memberYn, memberYn) ||
                other.memberYn == memberYn) &&
            (identical(other.gateYn, gateYn) || other.gateYn == gateYn) &&
            (identical(other.parkingStatusYn, parkingStatusYn) ||
                other.parkingStatusYn == parkingStatusYn) &&
            (identical(other.parkingHistoryYn, parkingHistoryYn) ||
                other.parkingHistoryYn == parkingHistoryYn) &&
            (identical(other.cctvYn, cctvYn) || other.cctvYn == cctvYn) &&
            (identical(other.emergencyYn, emergencyYn) ||
                other.emergencyYn == emergencyYn) &&
            (identical(other.lightYn, lightYn) || other.lightYn == lightYn) &&
            (identical(other.apartmentYn, apartmentYn) ||
                other.apartmentYn == apartmentYn) &&
            (identical(other.adminAppYn, adminAppYn) ||
                other.adminAppYn == adminAppYn) &&
            (identical(other.isMaster, isMaster) ||
                other.isMaster == isMaster));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      id,
      name,
      adminYn,
      memberYn,
      gateYn,
      parkingStatusYn,
      parkingHistoryYn,
      cctvYn,
      emergencyYn,
      lightYn,
      apartmentYn,
      adminAppYn,
      isMaster);

  /// Create a copy of Authority
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorityImplCopyWith<_$AuthorityImpl> get copyWith =>
      __$$AuthorityImplCopyWithImpl<_$AuthorityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorityImplToJson(
      this,
    );
  }
}

abstract class _Authority implements Authority {
  const factory _Authority(
      {required final String createdAt,
      required final String updatedAt,
      required final int id,
      required final String name,
      required final bool adminYn,
      required final bool memberYn,
      required final bool gateYn,
      required final bool parkingStatusYn,
      required final bool parkingHistoryYn,
      required final bool cctvYn,
      required final bool emergencyYn,
      required final bool lightYn,
      required final bool apartmentYn,
      required final bool adminAppYn,
      required final bool isMaster}) = _$AuthorityImpl;

  factory _Authority.fromJson(Map<String, dynamic> json) =
      _$AuthorityImpl.fromJson;

  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get id;
  @override
  String get name;
  @override
  bool get adminYn;
  @override
  bool get memberYn;
  @override
  bool get gateYn;
  @override
  bool get parkingStatusYn;
  @override
  bool get parkingHistoryYn;
  @override
  bool get cctvYn;
  @override
  bool get emergencyYn;
  @override
  bool get lightYn;
  @override
  bool get apartmentYn;
  @override
  bool get adminAppYn;
  @override
  bool get isMaster;

  /// Create a copy of Authority
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorityImplCopyWith<_$AuthorityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Token _$TokenFromJson(Map<String, dynamic> json) {
  return _Token.fromJson(json);
}

/// @nodoc
mixin _$Token {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  /// Serializes this Token to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenCopyWith<Token> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenCopyWith<$Res> {
  factory $TokenCopyWith(Token value, $Res Function(Token) then) =
      _$TokenCopyWithImpl<$Res, Token>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenCopyWithImpl<$Res, $Val extends Token>
    implements $TokenCopyWith<$Res> {
  _$TokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenImplCopyWith<$Res> implements $TokenCopyWith<$Res> {
  factory _$$TokenImplCopyWith(
          _$TokenImpl value, $Res Function(_$TokenImpl) then) =
      __$$TokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$TokenImplCopyWithImpl<$Res>
    extends _$TokenCopyWithImpl<$Res, _$TokenImpl>
    implements _$$TokenImplCopyWith<$Res> {
  __$$TokenImplCopyWithImpl(
      _$TokenImpl _value, $Res Function(_$TokenImpl) _then)
      : super(_value, _then);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$TokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenImpl implements _Token {
  const _$TokenImpl({required this.accessToken, required this.refreshToken});

  factory _$TokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      __$$TokenImplCopyWithImpl<_$TokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenImplToJson(
      this,
    );
  }
}

abstract class _Token implements Token {
  const factory _Token(
      {required final String accessToken,
      required final String refreshToken}) = _$TokenImpl;

  factory _Token.fromJson(Map<String, dynamic> json) = _$TokenImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;

  /// Create a copy of Token
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenImplCopyWith<_$TokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
