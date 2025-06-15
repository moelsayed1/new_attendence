import 'package:flutter/material.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_attendence/features/login/presentation/cubit/login_cubit.dart';
import 'package:new_attendence/main.dart'; // Import main.dart to access scaffoldMessengerKey

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
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
        } else if (state is LoginFailure) {
          scaffoldMessengerKey.currentState?.showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFF8A2BE2), // Violet color from the image
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      // Image at the top
                      Image.asset(
                        'assets/images/alarm_clock.png', // We'll add this asset later
                        height: 200,
                      ),
                      const SizedBox(height: 20),
                      // Text above input fields
                      Text(
                        AppLocalizations.of(context)!.loginPrompt,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Account Input Field
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: AppLocalizations.of(context)!.whatIsYourAccount,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.person, color: Color(0xFF8A2BE2)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Password Input Field
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: AppLocalizations.of(context)!.oldPassword,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Icon(Icons.lock, color: Color(0xFF8A2BE2)),
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.visibility, color: Color(0xFF8A2BE2)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Forgot password text
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.forgotPassword,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Login Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
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
                            backgroundColor: Colors.cyanAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: state is LoginLoading
                              ? const CircularProgressIndicator(color: Color(0xFF8A2BE2))
                              : Text(
                                  AppLocalizations.of(context)!.loginButton,
                                  style: const TextStyle(
                                    color: Color(0xFF8A2BE2),
                                    fontSize: 18,
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