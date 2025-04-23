import 'package:flutter/material.dart';
import 'package:flutter_core/core/router/guards/auth_guard.dart';
import 'package:flutter_core/core/router/router.dart';
import 'package:flutter_core/core/router/shells/main_shell.dart';
import 'package:flutter_core/src/features/auth/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        builder: (_, __) => const LoginScreen(),
        redirect: AuthGuard.requireAuth,
      ),
      //MainShell.route, // ✅ BottomNav Shell 포함
    ],
    errorBuilder:
        (_, __) => const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
