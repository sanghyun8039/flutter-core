import 'dart:async';
import 'package:ferry/ferry.dart';
import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:gql_exec/gql_exec.dart';

class GqlRefreshLink extends Link {
  final TokenRepository _tokenRepository;
  bool _isRefreshing = false;
  final _refreshCompleter = Completer<String>();

  GqlRefreshLink({required TokenRepository tokenRepository})
    : _tokenRepository = tokenRepository;

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    try {
      yield* forward!(request);
    } catch (error) {
      if (_isUnauthorizedError(error)) {
        try {
          // 동시성 처리
          if (_isRefreshing) {
            final newToken = await _refreshCompleter.future;
            yield* _retryRequest(request, newToken, forward!);
            return;
          }

          _isRefreshing = true;
          try {
            final newToken = await _doRefresh(
              request,
            ); // refreshToken 불러와서 발급 요청
            _refreshCompleter.complete(newToken); // 한 번만 complete

            yield* _retryRequest(request, newToken ?? '', forward!);
          } catch (e) {
            await _tokenRepository.clearTokens();
            _refreshCompleter.completeError(e); // 에러로 완료 처리
            rethrow;
          } finally {
            _isRefreshing = false;
          }
        } catch (e) {
          await _tokenRepository.clearTokens();
          rethrow;
        }
      } else {
        rethrow;
      }
    }
  }

  bool _isUnauthorizedError(dynamic error) {
    if (error is ServerException) {
      return error.statusCode == 401;
    }
    return error.toString().contains("UNAUTHORIZED");
  }

  Future<String?> _doRefresh(Request request) async {
    final refreshToken = await _tokenRepository.getRefreshToken();
    return refreshToken.fold((failure) => '', (token) => token);
  }

  Stream<Response> _retryRequest(
    Request request,
    String newToken,
    NextLink forward,
  ) async* {
    final updatedRequest = request.updateContextEntry<HttpLinkHeaders>(
      (headers) => HttpLinkHeaders(
        headers: {...?headers?.headers, 'Authorization': 'Bearer $newToken'},
      ),
    );
    yield* forward(updatedRequest);
  }
}
