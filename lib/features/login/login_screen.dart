import 'package:flutter/material.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_attendence/features/login/presentation/cubit/login_cubit.dart';
import 'package:new_attendence/main.dart'; // Import main.dart to access scaffoldMessengerKey
import 'package:new_attendence/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_attendence/features/login/presentation/widgets/login_logo_section.dart';
import 'package:new_attendence/features/login/presentation/widgets/login_prompt_text.dart';
import 'package:new_attendence/features/login/presentation/widgets/login_input_fields.dart';
import 'package:new_attendence/features/login/presentation/widgets/login_forgot_password_text.dart';
import 'package:new_attendence/features/login/presentation/widgets/login_button.dart';
import 'package:new_attendence/features/home/face_image_screen.dart'; // Import FaceImageScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<LoginInputFieldsState> _inputFieldsKey = GlobalKey<LoginInputFieldsState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          // Navigate to FaceImageScreen on successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const FaceImageScreen()),
          );
        } else if (state is LoginFailure) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF7E6DEA),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      const LoginLogoSection(),
                      const LoginPromptText(),
                      LoginInputFields(key: _inputFieldsKey),
                      const LoginForgotPasswordText(),
                      LoginButton(
                        isLoading: state is LoginLoading,
                        onPressed: () {
                          // final String username = _inputFieldsKey.currentState?.username ?? ''; // Commented out username
                          // final String password = _inputFieldsKey.currentState?.password ?? ''; // Commented out password
                          // context.read<LoginCubit>().login(
                          //   username,
                          //   password,
                          // ); // Commented out login logic

                          // Directly navigate to FaceImageScreen for testing
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const FaceImageScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
} 