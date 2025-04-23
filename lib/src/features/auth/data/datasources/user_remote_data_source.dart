import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/models/user_request.dart';
import 'package:flutter_core/src/features/auth/data/models/user_response.dart';

abstract class UserRemoteDataSource {
  ResultFuture<UserResponse> getUser(UserRequest userRequest);
}
