import 'package:flutter_core/core/permissions/permission_request.dart';
import 'package:flutter_core/core/permissions/permission_types.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  /// 단일 권한 요청 (AppPermissionRequest를 받아 필수 여부와 관계없이 요청)
  static Future<bool> request(AppPermissionRequest request) async {
    final permission = _mapPermission(request.type);
    var status = await permission.status;

    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      status = await permission.request();
    }

    if (request.isRequired && !status.isGranted) {
      return false; // 필수 권한인데 허용되지 않음
    }

    return status.isGranted;
  }

  /// 여러 권한 요청 (List<AppPermissionRequest>)
  static Future<bool> requestPermissions(
    List<AppPermissionRequest> permissions,
  ) async {
    bool isAllRequiredPermissionsGranted = true;
    for (var permission in permissions) {
      var mapped = _mapPermission(permission.type);
      var status = await mapped.status;

      if (!status.isGranted) {
        status = await mapped.request();
      }

      if (permission.isRequired && !status.isGranted) {
        isAllRequiredPermissionsGranted = false;
      }
    }
    return isAllRequiredPermissionsGranted;
  }

  static Permission _mapPermission(AppPermissionType type) {
    switch (type) {
      case AppPermissionType.location:
        return Permission.location;
      case AppPermissionType.camera:
        return Permission.camera;
      case AppPermissionType.microphone:
        return Permission.microphone;
      case AppPermissionType.storage:
        return Permission.storage;
    }
  }
}
