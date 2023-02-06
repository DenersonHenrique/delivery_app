import 'dart:developer';
import 'package:dio/dio.dart';

import 'auth_repository.dart';
import '../../models/auth_model.dart';
import '../../core/config/client/custom_dio.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';

class AuthRepositoryImpl extends AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({
    required this.dio,
  });

  @override
  Future<void> register(String name, String email, String password) async {
    try {
      await dio.unauth().post('/users', data: {
        'name': name,
        'email': email,
        'password': password,
      });
    } on DioError catch (error, stack) {
      log(
        'Erro ao registrar usuário',
        error: error,
        stackTrace: stack,
      );
      throw RepositoryException(message: 'Erro ao registrar usuário');
    }
  }

  @override
  Future<AuthModel> signIn(String email, String password) async {
    try {
      final result = await dio.unauth().post('/auth', data: {
        'email': email,
        'password': password,
      });

      return AuthModel.fromMap(result.data);
    } on DioError catch (error, stack) {
      if (error.response?.statusCode == 403) {
        log('Permissão negada', error: error, stackTrace: stack);
        throw UnauthorizedException();
      }

      log('Erro ao autenticar usuário', error: error, stackTrace: stack);
      throw RepositoryException(message: 'Erro ao autenticar usuário');
    }
  }
}
