import 'package:dio/dio.dart';
import 'package:flutter_core/core/network/dio/dio_interceptors.dart';
import 'package:flutter_core/core/network/dio/dio_options.dart';
import 'package:flutter_core/core/auth/repositories/token_repository.dart';

class DioClient {
  final Dio _dio;
  final String _baseUrl;
  DioClient({
    required String baseUrl,
    required TokenRepository tokenRepository,
    List<Interceptor>? interceptors,
  }) : _baseUrl = baseUrl,
       _dio = Dio() {
    _dio.options = DioOptions.getBaseOptions(baseUrl);
    _dio.interceptors.addAll([
      ...DioInterceptors().getDefaultInterceptors(
        tokenRepository: tokenRepository,
        dio: _dio,
      ),
      ...?interceptors,
    ]);
  }

  Dio get dio => _dio;

  String get baseUrl => _baseUrl;
}
