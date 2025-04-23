import 'package:dartz/dartz.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/core/utils/typedef.dart';
import 'package:flutter_core/src/features/auth/data/datasources/user_remote_data_source.dart';
import 'package:flutter_core/src/features/auth/data/models/user_request.dart';
import 'package:flutter_core/src/features/auth/data/models/user_response.dart';
import 'package:flutter_core/src/features/auth/domain/entities/user.dart';
import 'package:flutter_core/src/features/auth/data/operations/__generated__/user.req.gql.dart';
import 'package:ferry/ferry.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  final Client _client;

  UserRemoteDataSourceImpl(this._client);

  @override
  ResultFuture<UserResponse> getUser(UserRequest userRequest) async {
    try {
      final request = GGetUserReq((b) => b..vars.id = userRequest.id);
      final response = await _client.request(request).first;

      if (response.hasErrors) {
        return left(
          ServerFailure(
            message: response.graphqlErrors?.first.message ?? 'Unknown error',
            statusCode: null,
          ),
        );
      }

      final userData = response.data?.user;
      if (userData == null) {
        return left(ServerFailure(message: 'User not found', statusCode: null));
      }

      return right(
        UserResponse(
          id: userData.id ?? '',
          userName: userData.username ?? '',
          email: userData.email ?? '',
        ),
      );
    } catch (e) {
      return left(ServerFailure(message: e.toString(), statusCode: null));
    }
  }
}
