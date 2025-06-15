import 'package:new_attendence/features/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<User> login(String username, String password);
} 