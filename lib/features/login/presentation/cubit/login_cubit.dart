import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_attendence/features/login/domain/usecases/login_user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser _loginUser;

  LoginCubit(this._loginUser) : super(LoginInitial());

  Future<void> login(String username, String password) async {
    emit(LoginLoading());
    try {
      await _loginUser(username, password);
      emit(LoginSuccess('Login Successful!'));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
} 