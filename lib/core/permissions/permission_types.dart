enum AppPermissionType { location, camera, microphone, storage }

extension AppPermissionTypeExtension on AppPermissionType {
  String get label {
    switch (this) {
      case AppPermissionType.location:
        return '위치';
      case AppPermissionType.camera:
        return '카메라';
      case AppPermissionType.microphone:
        return '마이크';
      case AppPermissionType.storage:
        return '저장공간';
    }
  }
}
