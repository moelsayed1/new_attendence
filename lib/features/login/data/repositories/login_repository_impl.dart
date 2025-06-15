import 'package:new_attendence/features/login/data/datasources/login_remote_datasource.dart';
import 'package:new_attendence/features/login/domain/entities/user.dart';
import 'package:new_attendence/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> login(String username, String password) async {
    try {
      final userModel = await remoteDataSource.login(username, password);
      return userModel; // UserModel is a subclass of User
    } catch (e) {
      rethrow; // Re-throw the exception for the presentation layer to handle
    }
  }
} 