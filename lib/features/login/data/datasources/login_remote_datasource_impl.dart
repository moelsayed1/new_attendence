import 'package:new_attendence/features/login/data/datasources/login_remote_datasource.dart';
import 'package:new_attendence/features/login/data/models/user_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<UserModel> login(String username, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    if (username == 'test' && password == 'password') {
      return const UserModel(id: '1', username: 'test');
    } else {
      throw Exception('Invalid credentials');
    }
  }
} 