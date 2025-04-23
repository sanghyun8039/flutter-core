import 'package:flutter_core/core/auth/repositories/token_repository.dart';

class GqlConfig {
  final String baseUrl;
  final String? accessToken;
  final TokenRepository tokenRepository;

  GqlConfig({
    required this.baseUrl,
    this.accessToken,
    required this.tokenRepository,
  });
}
