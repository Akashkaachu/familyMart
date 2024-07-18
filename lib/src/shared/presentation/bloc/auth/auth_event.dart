part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUp(UserModel userModel) = _SignUpEvent;
  const factory AuthEvent.logIn(UserModel userModelData) = _LogInEvent;
}
