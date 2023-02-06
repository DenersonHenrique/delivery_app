import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'register_state.dart';
import '../../repositories/auth/auth_repository.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterController(this._authRepository)
      : super(const RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));
      await _authRepository.register(name, email, password);
      emit(state.copyWith(status: RegisterStatus.success));
    } catch (error, stack) {
      log('Erro ao registrar usuário', error: error, stackTrace: stack);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
