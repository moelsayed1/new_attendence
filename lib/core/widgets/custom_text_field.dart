import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String prefixIconPath;
  final String? suffixIconPath;
  final bool obscureText;
  final Color? iconColor;
  final Color backgroundColor;
  final double borderRadius;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final double iconSize;
  final VoidCallback? onSuffixIconTap;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIconPath,
    this.suffixIconPath,
    this.obscureText = false,
    this.iconColor,
    this.backgroundColor = Colors.white,
    this.borderRadius = 25.0,
    this.keyboardType,
    this.validator,
    this.iconSize = 24.0,
    this.onSuffixIconTap,
  });

  Widget _buildIcon(String path, Color? color) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: iconSize.w,
        height: iconSize.h,
        colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      );
    } else {
      return Image.asset(
        path,
        width: iconSize.w,
        height: iconSize.h,
        color: color,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: 10.sp,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 10.sp,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: _buildIcon(prefixIconPath, iconColor),
        ),
        suffixIcon: suffixIconPath != null
            ? GestureDetector(
                onTap: onSuffixIconTap,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: _buildIcon(suffixIconPath!,
                   iconColor),
                ),
              )
            : null,
      ),
    );
  }
}