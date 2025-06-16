import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginLogoSection extends StatelessWidget {
  const LoginLogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Image.asset(
          'assets/images/alarm_clock.png',
          height: 200.h,
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
} 