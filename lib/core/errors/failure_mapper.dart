import 'package:dio/dio.dart';
import 'package:flutter_core/core/errors/exceptions.dart';
import 'package:flutter_core/core/errors/failures.dart';

/// Exception을 Failure로 변환하는 Mapper
class FailureMapper {
  /// ServerException을 해당하는 ServerFailure로 변환
  static ServerFailure mapServerException(ServerException exception) {
    switch (exception.statusCode) {
      case 400:
        return BadRequestFailure.fromException(
          exception as BadRequestException,
        );
      case 401:
        return UnauthorizedFailure.fromException(
          exception as UnauthorizedException,
        );
      case 403:
        return ForbiddenFailure.fromException(exception as ForbiddenException);
      case 404:
        return NotFoundFailure.fromException(exception as NotFoundException);
      case 405:
        return MethodNotAllowedFailure.fromException(
          exception as MethodNotAllowedException,
        );
      case 408:
        return RequestTimeoutFailure.fromException(
          exception as RequestTimeoutException,
        );
      case 409:
        return ConflictFailure.fromException(exception as ConflictException);
      case 422:
        return UnprocessableEntityFailure.fromException(
          exception as UnprocessableEntityException,
        );
      case 429:
        return TooManyRequestsFailure.fromException(
          exception as TooManyRequestsException,
        );
      case 500:
        return InternalServerFailure.fromException(
          exception as InternalServerException,
        );
      case 503:
        return ServiceUnavailableFailure.fromException(
          exception as ServiceUnavailableException,
        );
      default:
        return ServerFailure.fromException(exception);
    }
  }

  /// AppException을 해당하는 AppFailure로 변환
  static AppFailure mapException(AppException exception) {
    if (exception is ServerException) {
      return mapServerException(exception);
    } else if (exception is CacheException) {
      return CacheFailure.fromException(exception);
    } else if (exception is NoInternetException) {
      return NoInternetFailure.fromException(exception);
    } else if (exception is TimeoutException) {
      return TimeoutFailure.fromException(exception);
    } else if (exception is ParseException) {
      return ParseFailure.fromException(exception);
    } else if (exception is UnknownException) {
      return UnknownFailure.fromException(exception);
    } else {
      return UnknownFailure(
        message: '알 수 없는 예외가 발생했습니다: ${exception.runtimeType}',
      );
    }
  }

  /// DioError를 AppFailure로 변환
  static AppFailure mapDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return TimeoutFailure(message: '요청 시간이 초과되었습니다: ${error.message}');

      case DioExceptionType.badResponse:
        if (error.response?.statusCode != null) {
          final statusCode = error.response!.statusCode!;
          final message =
              error.response?.data?['message'] ??
              error.message ??
              '서버 오류가 발생했습니다';

          return ServerFailure(
            message: message.toString(),
            statusCode: statusCode,
          );
        }
        return InternalServerFailure(message: error.message ?? '서버 오류가 발생했습니다');

      case DioExceptionType.cancel:
        return UnknownFailure(message: '요청이 취소되었습니다');

      case DioExceptionType.connectionError:
        return NoInternetFailure(message: '인터넷 연결을 확인해주세요');

      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: '인증서 오류가 발생했습니다',
          statusCode: 'BAD_CERTIFICATE',
        );

      case DioExceptionType.unknown:
        if (error.error is FormatException) {
          return ParseFailure(message: '데이터 형식이 올바르지 않습니다');
        }
        return UnknownFailure(message: error.message ?? '알 수 없는 오류가 발생했습니다');
    }
  }

  /// 일반 Exception을 AppFailure로 변환
  static AppFailure mapToFailure(dynamic exception) {
    if (exception is DioException) {
      return mapDioError(exception);
    } else if (exception is AppException) {
      return mapException(exception);
    } else {
      return UnknownFailure(
        message: '알 수 없는 오류가 발생했습니다: ${exception.toString()}',
      );
    }
  }
}
