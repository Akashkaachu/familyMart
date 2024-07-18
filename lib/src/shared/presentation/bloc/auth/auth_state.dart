part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _AuthStateLoading;
  const factory AuthState.loggedIn(String token) = _LoggedIn;
  const factory AuthState.error(String message) = _AuthStateErro;
}
