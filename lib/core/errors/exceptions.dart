import 'package:equatable/equatable.dart';

/// 공통 Exception 추상 클래스
abstract class AppException extends Equatable implements Exception {
  final String message;
  final dynamic statusCode;

  const AppException({required this.message, this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

//
// 🌐 서버 예외
//

class ServerException extends AppException {
  const ServerException({required super.message, required super.statusCode});
}

/// 400 - 잘못된 요청
class BadRequestException extends ServerException {
  const BadRequestException({required super.message}) : super(statusCode: 400);
}

/// 401 - 인증 실패
class UnauthorizedException extends ServerException {
  const UnauthorizedException({required super.message})
    : super(statusCode: 401);
}

/// 403 - 접근 권한 없음
class ForbiddenException extends ServerException {
  const ForbiddenException({required super.message}) : super(statusCode: 403);
}

/// 404 - 찾을 수 없음
class NotFoundException extends ServerException {
  const NotFoundException({required super.message}) : super(statusCode: 404);
}

/// 405 - 허용되지 않은 메서드
class MethodNotAllowedException extends ServerException {
  const MethodNotAllowedException({required super.message})
    : super(statusCode: 405);
}

/// 408 - 요청 시간 초과
class RequestTimeoutException extends ServerException {
  const RequestTimeoutException({required super.message})
    : super(statusCode: 408);
}

/// 409 - 충돌
class ConflictException extends ServerException {
  const ConflictException({required super.message}) : super(statusCode: 409);
}

/// 422 - 요청 유효성 검사 실패 (ex: 폼 에러)
class UnprocessableEntityException extends ServerException {
  const UnprocessableEntityException({required super.message})
    : super(statusCode: 422);
}

/// 429 - 요청 너무 많음 (Rate Limit)
class TooManyRequestsException extends ServerException {
  const TooManyRequestsException({required super.message})
    : super(statusCode: 429);
}

/// 500 - 내부 서버 오류
class InternalServerException extends ServerException {
  const InternalServerException({required super.message})
    : super(statusCode: 500);
}

/// 503 - 서비스 이용 불가
class ServiceUnavailableException extends ServerException {
  const ServiceUnavailableException({required super.message})
    : super(statusCode: 503);
}

//
// 📦 클라이언트 예외 (오프라인, 캐시 등)
//

/// 로컬 캐시 오류 (SharedPref, Hive 등)
class CacheException extends AppException {
  const CacheException({required super.message, super.statusCode = 500});
}

/// 인터넷 연결 없음
class NoInternetException extends AppException {
  const NoInternetException({super.message = '인터넷 연결이 없습니다'});
}

/// 요청 시간 초과 (Dio Timeout 등)
class TimeoutException extends AppException {
  const TimeoutException({super.message = '요청 시간이 초과되었습니다'});
}

/// JSON 파싱 오류
class ParseException extends AppException {
  const ParseException({super.message = '데이터 처리 오류가 발생했습니다'});
}

//
// ❓ 알 수 없는 예외
//

class UnknownException extends AppException {
  const UnknownException({super.message = '알 수 없는 오류가 발생했습니다'});
}
