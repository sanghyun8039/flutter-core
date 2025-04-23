import 'package:flutter_core/core/utils/typedef.dart';

abstract class TokenRemoteDataSource {
  ResultFuture<String?> refreshToken(String refreshToken);
}
