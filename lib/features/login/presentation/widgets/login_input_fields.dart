import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:new_attendence/core/widgets/custom_text_field.dart';

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({super.key});

  @override
  State<LoginInputFields> createState() => LoginInputFieldsState();
}

class LoginInputFieldsState extends State<LoginInputFields> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  // Public getters to access the text from controllers
  String get username => _usernameController.text;
  String get password => _passwordController.text;

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
    return Column(
      children: [
        CustomTextField(
          controller: _usernameController,
          hintText: AppLocalizations.of(context)!.whatIsYourAccount,
          prefixIconPath: 'assets/images/username_logo.png',
        ),
        SizedBox(height: 16.h),
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
      ],
    );
  }
} 