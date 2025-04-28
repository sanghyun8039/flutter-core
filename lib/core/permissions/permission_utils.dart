import 'package:flutter/material.dart';
import 'package:flutter_core/core/permissions/permission_handler.dart';
import 'package:flutter_core/core/permissions/permission_request.dart';
import 'package:flutter_core/core/permissions/permission_types.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  /// 단일 권한 요청 및 처리
  static Future<bool> requestSinglePermission({
    required BuildContext context,
    required AppPermissionType type,
  }) async {
    final granted = await PermissionHandler.request(
      AppPermissionRequest(type: type, isRequired: true),
    );

    if (!granted) {
      if (context.mounted) {
        await _showPermissionDeniedDialog(context, type);
      }
    }
    return granted;
  }

  /// 여러 권한 요청 및 처리
  static Future<bool> requestMultiplePermissions({
    required BuildContext context,
    required List<AppPermissionRequest> permissions,
  }) async {
    final allRequiredGranted = await PermissionHandler.requestPermissions(
      permissions,
    );

    if (!allRequiredGranted) {
      if (context.mounted) {
        await _showPermissionDeniedDialog(context, null); // 여러 권한일 경우 타입 없이 안내
      }
    }
    return allRequiredGranted;
  }

  /// 권한 거부 시 보여줄 기본 다이얼로그
  static Future<void> _showPermissionDeniedDialog(
    BuildContext context,
    AppPermissionType? type,
  ) async {
    final title = '권한 허용 필요';
    final content =
        type != null
            ? '${type.label} 권한이 필요합니다.'
            : '필수 권한이 허용되지 않았습니다.\n설정으로 이동해 권한을 허용해주세요.';

    await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                child: const Text('설정 이동'),
              ),
            ],
          ),
    );
  }
}
