import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonImageIcon extends StatelessWidget {
  final String assetPath;
  final double? size;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BoxFit fit;

  const CommonImageIcon({
    super.key,
    required this.assetPath,
    this.size,
    this.color,
    this.padding,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 10.w),
      child: Image.asset(
        assetPath,
        width: size?.w ?? 24.w,
        height: size?.h ?? 24.h,
        color: color,
        fit: fit,
      ),
    );
  }
} 