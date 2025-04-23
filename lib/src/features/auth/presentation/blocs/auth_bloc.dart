import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_core/src/features/auth/data/models/login_request.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_core/src/features/auth/domain/usecases/logout_use_case.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/auth_event.dart';
import 'package:flutter_core/src/features/auth/presentation/blocs/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required LogoutUseCase logoutUseCase,
  }) : _loginUseCase = loginUseCase,
       _logoutUseCase = logoutUseCase,
       super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await _loginUseCase(
        LoginRequest(username: event.username, password: event.password),
      );
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (token) => emit(AuthAuthenticated()),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await _logoutUseCase();
      result.fold(
        (failure) => emit(AuthError(failure.message)),
        (_) => emit(AuthUnauthenticated()),
      );
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
