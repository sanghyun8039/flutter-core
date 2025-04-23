import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/data/models/user_request.dart';
import 'package:flutter_core/src/features/auth/domain/entities/user.dart';
import 'package:flutter_core/src/features/auth/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  ResultFuture<User> getUser(String id) async {
    try {
      final response = await _userRemoteDataSource.getUser(UserRequest(id: id));
      return response.fold(
        (failure) => left(failure),
        (userResponse) => right(
          User(
            id: userResponse.id,
            userName: userResponse.userName,
            email: userResponse.email,
          ),
        ),
      );
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }
}
