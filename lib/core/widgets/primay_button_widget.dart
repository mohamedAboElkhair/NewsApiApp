import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_colors.dart';

class PrimayButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final Color? textColor;
  final Function()? onPressed;
  final double? fontSize;
  const PrimayButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.bordersRadius,
    this.height,
    this.width,
    this.textColor,
    this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(bordersRadius ?? 100.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
