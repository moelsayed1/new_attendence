import 'package:new_attendence/features/login/data/models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(String username, String password);
} 