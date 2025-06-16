import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_attendence/l10n/app_localizations.dart';

class LoginPromptText extends StatelessWidget {
  const LoginPromptText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
} 