import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/localization/localization_config.dart';
import 'package:flutter_core/core/services/injection_container.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/user_bloc.dart';
import 'package:flutter_core/src/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_core/src/features/auth/presentation/screens/user_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: LocalizationConfig.localizationsDelegates,
      supportedLocales: LocalizationConfig.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => sl<UserBloc>(),
        child: const UserScreen(),
      ),
      // home: BlocProvider(
      //   create: (context) => sl<AuthBloc>(),
      //   child: const LoginScreen(),
      // ),
    );
  }
}



// 현재 `core/` 디렉토리 구성이 **굉장히 정갈하고 실전 서비스 수준으로 잘 잡혀 있습니다** 👏  
// 각 디렉토리의 책임이 명확해서 확장성과 유지보수성도 뛰어납니다.  

// ---

// ## ✅ 현재 구성 요약

// | 디렉토리 | 용도 |
// |----------|------|
// | `layout/` | 공통 레이아웃 (Scaffold, Shell 등) |
// | `router/` | GoRouter, ShellRoute, Guard 등 라우팅 |
// | `services/` | 외부 연동 또는 앱 전역 서비스 (Firebase, Storage 등) |
// | `auth/` | Core-level 인증 관리 (토큰 저장소, 리프레시 등) |
// | `api/` | Dio, API client, Interceptor 등 네트워크 계층 |
// | `utils/` | 공통 함수, 날짜 처리, 포맷터 등 |
// | `errors/` | 예외 및 Failure, Exception Mapper 등 |

// ---

// ## ✅ 추가 고려 가능한 디렉토리 제안

// | 디렉토리 | 도입 추천 | 이유 |
// |----------|-------------|------|
// | `constants/` | ✅ **강력 추천** | Route name, app title, shared keys, colors, enum values 등 상수들 |
// | `theme/` | ✅ **추천** | 공통 ThemeData, TextStyle, ColorScheme, Dark/Light mode 대응 |
// | `extensions/` | ✅ **많이 쓰면 추천** | `BuildContext`, `DateTime`, `String` 등 커스텀 확장 메서드 |
// | `logger/` | ⛳️ 선택 | 앱 전역 로깅 시스템 (debugPrint 대체, 로그 필터링, remote log 가능) |
// | `locale/` | ⛳️ 국제화 대응 시 | 다국어를 고려하면 `core/locale`에 arb 관리 또는 helper 제공 |
// | `storage/` | ⛳️ LocalStorage 분리 시 | shared_preferences, secure_storage 등 추상화 계층 분리할 때 유용 |
// | `config/` | ⛳️ 환경별 세팅 필요시 | AppConfig (dev, prod), baseUrl, 앱 이름, analytics toggle 등 |

// ---

// ## 🧩 예시: 추가 구조 스냅샷

// ```plaintext
// core/
// ├── api/
// ├── auth/
// ├── constants/       ← ✅ AppRoutes, HiveKeys, Strings
// ├── errors/
// ├── extensions/      ← ✅ StringExt, DateTimeExt
// ├── layout/
// ├── locale/          ← ⛳️ i18n 대응
// ├── logger/          ← ⛳️ 전역 로그 시스템
// ├── router/
// ├── services/
// ├── storage/         ← ⛳️ LocalStorage / SecureStorage
// ├── theme/           ← ✅ AppTheme, AppTextStyle, Color
// ├── utils/
// ```

// ---

// ## ✅ 어떤 경우 확장해야 할까?

// - ✅ `constants/`는 **항상 쓰게 됩니다** (route 이름, shared key, enum label 등)
// - ✅ `theme/`도 디자인 시스템이 명확해질수록 필수
// - ✅ `extensions/`는 buildContext에 대한 `.showSnackBar()`, `.paddingX()` 같은 커스텀 메서드에서 자주 필요
// - ⛳️ `locale/`, `config/`, `logger/`는 프로젝트 규모나 다국어, 환경 구분 여부에 따라 선택

// ---

// ## ✅ 결론

// | 항목 | 추천 여부 | 이유 |
// |------|------------|------|
// | `constants/` | ✅ 꼭 추가 추천 | 모든 상수(경로, 키, 이름) 정리 |
// | `theme/` | ✅ 디자인 고정화 시 필수 | 다크모드, 스타일 일관성 |
// | `extensions/` | ✅ 쓰면 무조건 편해짐 | 중복 줄이고 코드 가독성 향상 |
// | 기타 (`logger`, `locale`, `config`) | ⛳️ 선택적 확장 | 앱 성격에 따라 유동적으로 추가 |

// ---

// 필요하시면:
// - `constants/` 정리 템플릿 (`AppRoutes`, `HiveKeys`, `SecureKeys`, `AppStrings`)
// - `theme/` 구성 방법 (`TextTheme`, `Color`, `ElevatedButtonThemeData`)
// - `build_context_extensions.dart` 예제

// 도 빠르게 제공해드릴게요!

// 어떤 디렉토리를 먼저 확장해볼까요? 😊