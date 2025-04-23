// lib/src/features/auth/presentation/blocs/user/user_event.dart

part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser(String id) = _GetUserEvent;
}
