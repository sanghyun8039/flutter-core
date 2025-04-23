import 'package:equatable/equatable.dart';
import 'package:flutter_core/core/errors/exceptions.dart';

/// 공통 Failure 추상 클래스
abstract class AppFailure extends Equatable {
  const AppFailure({required this.message, required this.statusCode})
    : assert(
        statusCode is String || statusCode is int,
        'statusCode must be a String or an int',
      );

  final String message;
  final dynamic statusCode;

  String get errorMessage =>
      '${statusCode is String ? '' : 'Error'} - $message';

  @override
  List<Object?> get props => [message, statusCode];
}

//
// 🌐 서버 실패
//

class ServerFailure extends AppFailure {
  const ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
    : this(message: exception.message, statusCode: exception.statusCode);
}

/// 400 - 잘못된 요청
class BadRequestFailure extends ServerFailure {
  const BadRequestFailure({required super.message}) : super(statusCode: 400);
  BadRequestFailure.fromException(BadRequestException exception)
    : this(message: exception.message);
}

/// 401 - 인증 실패
class UnauthorizedFailure extends ServerFailure {
  const UnauthorizedFailure({required super.message}) : super(statusCode: 401);
  UnauthorizedFailure.fromException(UnauthorizedException exception)
    : this(message: exception.message);
}

/// 403 - 접근 권한 없음
class ForbiddenFailure extends ServerFailure {
  const ForbiddenFailure({required super.message}) : super(statusCode: 403);
  ForbiddenFailure.fromException(ForbiddenException exception)
    : this(message: exception.message);
}

/// 404 - 찾을 수 없음
class NotFoundFailure extends ServerFailure {
  const NotFoundFailure({required super.message}) : super(statusCode: 404);
  NotFoundFailure.fromException(NotFoundException exception)
    : this(message: exception.message);
}

/// 405 - 허용되지 않은 메서드
class MethodNotAllowedFailure extends ServerFailure {
  const MethodNotAllowedFailure({required super.message})
    : super(statusCode: 405);
  MethodNotAllowedFailure.fromException(MethodNotAllowedException exception)
    : this(message: exception.message);
}

/// 408 - 요청 시간 초과
class RequestTimeoutFailure extends ServerFailure {
  const RequestTimeoutFailure({required super.message})
    : super(statusCode: 408);
  RequestTimeoutFailure.fromException(RequestTimeoutException exception)
    : this(message: exception.message);
}

/// 409 - 충돌
class ConflictFailure extends ServerFailure {
  const ConflictFailure({required super.message}) : super(statusCode: 409);
  ConflictFailure.fromException(ConflictException exception)
    : this(message: exception.message);
}

/// 422 - 요청 유효성 검사 실패
class UnprocessableEntityFailure extends ServerFailure {
  const UnprocessableEntityFailure({required super.message})
    : super(statusCode: 422);
  UnprocessableEntityFailure.fromException(
    UnprocessableEntityException exception,
  ) : this(message: exception.message);
}

/// 429 - 요청 너무 많음
class TooManyRequestsFailure extends ServerFailure {
  const TooManyRequestsFailure({required super.message})
    : super(statusCode: 429);
  TooManyRequestsFailure.fromException(TooManyRequestsException exception)
    : this(message: exception.message);
}

/// 500 - 내부 서버 오류
class InternalServerFailure extends ServerFailure {
  const InternalServerFailure({required super.message})
    : super(statusCode: 500);
  InternalServerFailure.fromException(InternalServerException exception)
    : this(message: exception.message);
}

/// 503 - 서비스 이용 불가
class ServiceUnavailableFailure extends ServerFailure {
  const ServiceUnavailableFailure({required super.message})
    : super(statusCode: 503);
  ServiceUnavailableFailure.fromException(ServiceUnavailableException exception)
    : this(message: exception.message);
}

//
// 📦 클라이언트 실패
//

/// 로컬 캐시 오류
class CacheFailure extends AppFailure {
  const CacheFailure({required super.message, super.statusCode = 500});
  CacheFailure.fromException(CacheException exception)
    : this(message: exception.message, statusCode: exception.statusCode);
}

/// 인터넷 연결 없음
class NoInternetFailure extends AppFailure {
  const NoInternetFailure({super.message = '인터넷 연결이 없습니다'})
    : super(statusCode: 'NO_INTERNET');
  NoInternetFailure.fromException(NoInternetException exception)
    : this(message: exception.message);
}

/// 요청 시간 초과
class TimeoutFailure extends AppFailure {
  const TimeoutFailure({super.message = '요청 시간이 초과되었습니다'})
    : super(statusCode: 'TIMEOUT');
  TimeoutFailure.fromException(TimeoutException exception)
    : this(message: exception.message);
}

/// JSON 파싱 오류
class ParseFailure extends AppFailure {
  const ParseFailure({super.message = '데이터 처리 오류가 발생했습니다'})
    : super(statusCode: 'PARSE_ERROR');
  ParseFailure.fromException(ParseException exception)
    : this(message: exception.message);
}

//
// ❓ 알 수 없는 실패
//

class UnknownFailure extends AppFailure {
  const UnknownFailure({super.message = '알 수 없는 오류가 발생했습니다'})
    : super(statusCode: 'UNKNOWN');
  UnknownFailure.fromException(UnknownException exception)
    : this(message: exception.message);
}
