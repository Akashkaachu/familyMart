import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/src/shared/domain/models/user_data_model.dart';
import 'package:ecommerce/src/shared/domain/repositories/auth/auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(const AuthState.initial()) {
    on<_SignUpEvent>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await authRepository.signup(event.userModel);
        log(result);
        if (result == 'success') {
          emit(const AuthState.loggedIn(''));
        } else {
          emit(AuthState.error(result));
        }
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
    on<_LogInEvent>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await authRepository.logIn(event.userModelData);
        log(result);
        if (result == 'success') {
          emit(const AuthState.loggedIn(''));
        } else {
          emit(AuthState.error(result));
        }
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
  }
}
