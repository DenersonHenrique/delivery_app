import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_state.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../core/exceptions/unauthorized_exception.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginController(this._authRepository) : super(const LoginState.initial());

  Future<void> signIn(String email, String password) async {
    try {
      emit(state.copyWith(status: LoginStatus.login));
      final authModel = await _authRepository.signIn(email, password);
      final storage = await SharedPreferences.getInstance();
      storage.setString('accessToken', authModel.accessToken);
      storage.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (error, stack) {
      log('E-mail ou senha invalidos.', error: error, stackTrace: stack);
      emit(
        state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: 'E-mail ou senha invalidos.',
        ),
      );
    } catch (error, stack) {
      log('Erro ao realizar Login.', error: error, stackTrace: stack);
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'Erro ao realizar login.',
        ),
      );
    }
  }
}
