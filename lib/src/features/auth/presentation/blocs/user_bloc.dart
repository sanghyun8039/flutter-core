// lib/src/features/auth/presentation/blocs/user/user_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/core/errors/failures.dart';
import 'package:flutter_core/src/features/auth/domain/entities/user.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/get_user_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUserUseCase;

  UserBloc({required GetUserUseCase getUserUseCase})
    : _getUserUseCase = getUserUseCase,
      super(const UserState.initial()) {
    on<UserEvent>((event, emit) async {
      await event.map(getUser: (e) => _onGetUser(e, emit));
    });
  }

  Future<void> _onGetUser(_GetUserEvent event, Emitter<UserState> emit) async {
    emit(const UserState.loading());

    final result = await _getUserUseCase(event.id);

    result.fold(
      (failure) => emit(UserState.error(failure as ServerFailure)),
      (user) => emit(UserState.loaded(user)),
    );
  }
}
