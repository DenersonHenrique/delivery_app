import '../../models/auth_model.dart';

abstract class AuthRepository {
  Future<void> register(String name, String email, String password);

  Future<AuthModel> signIn(String email, String password);
}
