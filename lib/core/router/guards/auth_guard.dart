import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AuthGuard {
  static Future<String?> requireAuth(_, GoRouterState state) async {
    final tokenRepo = GetIt.instance<TokenRepository>();
    final hasTokens = await tokenRepo.hasTokens();

    if (!hasTokens.fold((failure) => false, (hasTokens) => hasTokens)) {
      return '/login'; // ❌ 인증 안됨 → 로그인 이동
    }
    return null; // ✅ 인증됨 → 접근 허용
  }
}
