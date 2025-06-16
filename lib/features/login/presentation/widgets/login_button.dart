import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_attendence/l10n/app_localizations.dart';
import 'package:new_attendence/features/login/presentation/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff27B6E3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: const Color(0xff27B6E3),
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
    );
  }
} 