// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '스마트 파킹';

  @override
  String get welcome => '환영합니다!';

  @override
  String get cameraPermission => '카메라 권한이 필요합니다.';
}
