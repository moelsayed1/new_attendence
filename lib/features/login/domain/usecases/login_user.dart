import 'package:new_attendence/features/login/domain/entities/user.dart';
import 'package:new_attendence/features/login/domain/repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
} 