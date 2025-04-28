import 'package:flutter_core/core/permissions/permission_types.dart';

class AppPermissionRequest {
  final AppPermissionType type;
  final bool isRequired; // 필수 여부

  AppPermissionRequest({required this.type, this.isRequired = false});
}
