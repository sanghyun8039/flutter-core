import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  ResultFuture<User> getUser(String id);
}
