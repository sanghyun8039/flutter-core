import 'package:flutter_core/core/layout/main_layout.dart';
import 'package:flutter_core/core/router/app_router.dart';
import 'package:flutter_core/core/router/guards/auth_guard.dart';
import 'package:flutter_core/core/router/router.dart';
import 'package:flutter_core/src/features/auth/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

class MainShell {
  static ShellRoute get route => ShellRoute(
    navigatorKey: AppRouter.shellNavigatorKey,
    redirect: AuthGuard.requireAuth,
    // 🧩 BottomNavigation이 공통으로 들어가는 레이아웃
    builder: (context, state, child) => MainLayout(child: child),

    routes: [
      GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginScreen()),
      // GoRoute(path: AppRoutes.home, builder: (_, __) => const HomePage()),
      // GoRoute(path: AppRoutes.profile, builder: (_, __) => const ProfilePage()),
      // GoRoute(
      //   path: AppRoutes.settings,
      //   builder: (_, __) => const SettingsPage(),
      // ),
    ],
  );
}
