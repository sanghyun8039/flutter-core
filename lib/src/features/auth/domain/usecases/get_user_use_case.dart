import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/domain/entities/user.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  ResultFuture<User> call(String id) async {
    return userRepository.getUser(id);
  }
}
