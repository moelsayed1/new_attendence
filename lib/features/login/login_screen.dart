import 'package:flutter/material.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_attendence/features/login/presentation/cubit/login_cubit.dart';
import 'package:new_attendence/main.dart'; // Import main.dart to access scaffoldMessengerKey
import 'package:new_attendence/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        } else if (state is LoginFailure) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF7E6DEA), // Violet color from the image
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      // Image at the top
                      Image.asset(
                        'assets/images/alarm_clock.png',
                        height: 200.h,
                      ),
                      SizedBox(height: 24.h),
                      // Text above input fields
                      Text(
                        AppLocalizations.of(context)!.loginPrompt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 57.h),
                      // Account Input Field
                      CustomTextField(
                        controller: _usernameController,
                        hintText: AppLocalizations.of(context)!.whatIsYourAccount,
                        prefixIconPath: 'assets/images/username_logo.png',
                      ),
                      SizedBox(height: 16.h),
                      // Password Input Field
                      CustomTextField(
                        controller: _passwordController,
                        hintText: AppLocalizations.of(context)!.oldPassword,
                        prefixIconPath: 'assets/images/password_logo.png',
                        suffixIconPath: _isPasswordVisible
                            ? 'assets/images/eye_visible.png'
                            : 'assets/images/eye_visible.png',
                        obscureText: !_isPasswordVisible,
                        onSuffixIconTap: _togglePasswordVisibility,
                      ),
                      SizedBox(height: 10.h),
                      // Forgot password text
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed: state is LoginLoading
                              ? null
                              : () {
                                  context.read<LoginCubit>().login(
                                        _usernameController.text,
                                        _passwordController.text,
                                      );
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff27B6E3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                          ),
                          child: state is LoginLoading
                              ? CircularProgressIndicator(
                                  color: const Color(0xFF27B6E3),
                                  strokeWidth: 2.w,
                                )
                              : Text(
                                  AppLocalizations.of(context)!.loginButton,
                                  style: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
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