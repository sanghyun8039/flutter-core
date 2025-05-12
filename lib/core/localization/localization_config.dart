import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalizationConfig {
  static const supportedLocales = [Locale('en'), Locale('ko')];

  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}
/*
🛠 적용 방법

1. l10n.yaml 파일 작성 (루트에)
2. pubspec.yaml 수정 필요 없음 (자동 감지)
3. 명령어 실행
flutter gen-l10n
 */