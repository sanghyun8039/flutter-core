import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_core/core/auth/repositories/token_repository.dart';
import 'package:flutter_core/core/errors/failure_mapper.dart';

class DioInterceptors {
  List<Interceptor> getDefaultInterceptors({
    required TokenRepository tokenRepository,
    required Dio dio,
  }) {
    return [
      // 로깅 인터셉터
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
      // 인증 인터셉터
      AuthInterceptor(tokenRepository: tokenRepository, dio: dio),
      // 에러 처리 인터셉터
      ErrorInterceptor(),
    ];
  }
}

// 커스텀 인터셉터 예시
class AuthInterceptor extends Interceptor {
  final TokenRepository _tokenRepository;
  final Dio _dio;
  bool _isRefreshing = false;
  final List<Completer> _pendingRequests = [];
  AuthInterceptor({required TokenRepository tokenRepository, required Dio dio})
    : _tokenRepository = tokenRepository,
      _dio = dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenRepository.getAccessToken();
    token.fold((failure) => null, (token) {
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    });
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      // 401 에러이고 토큰 재발급 중이 아닐 때
      if (err.response?.statusCode == 401 && !_isRefreshing) {
        _isRefreshing = true;

        try {
          final newToken = await _getNewToken(
            err.requestOptions.headers['Authorization'] ?? '',
          );
          if (newToken == null) {
            throw Exception('Failed to refresh token');
          }
          // 실패한 요청 재시도
          final response = await _retryRequest(err.requestOptions, newToken);
          handler.resolve(response);

          // 대기 중인 요청들 처리
          _processPendingRequests(newToken);
        } catch (e) {
          // 재발급 실패 시 모든 대기 중인 요청 실패 처리
          await _tokenRepository
              .clearTokens(); // ✅ 저장된 accessToken, refreshToken 제거

          _failPendingRequests(e);
          handler.reject(err);
        } finally {
          _isRefreshing = false;
        }
      } else {
        handler.next(err);
      }
    }
    handler.next(err); // 그대로 다음으로 넘김
  }

  Future<Response> _retryRequest(
    RequestOptions options,
    String newToken,
  ) async {
    options.headers.remove('Authorization');
    options.headers['Authorization'] = 'Bearer $newToken';
    return await _dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        headers: options.headers,
        contentType: options.contentType,
        responseType: options.responseType,
      ),
    );
  }

  void _processPendingRequests(String newToken) {
    for (final completer in _pendingRequests) {
      completer.complete(newToken);
    }
    _pendingRequests.clear();
  }

  void _failPendingRequests(dynamic error) {
    for (final completer in _pendingRequests) {
      completer.completeError(error);
    }
    _pendingRequests.clear();
  }

  Future<String?> _getNewToken(String refreshToken) async {
    final newToken = await _tokenRepository.refreshToken(refreshToken);
    return newToken.fold((failure) => null, (token) => token);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = FailureMapper.mapToFailure(err); // 🔥 예외 매핑
    handler.reject(err.copyWith(error: appException));
  }
}
