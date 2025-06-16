import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_attendence/l10n/app_localizations.dart';

class LoginForgotPasswordText extends StatelessWidget {
  const LoginForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
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
      ],
    );
  }
} 