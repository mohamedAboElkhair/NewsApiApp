import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_colors.dart';

class PrimayOutlinedButtonWidget extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final double? bordersRadius;
  final Color? textColor;
  final Function()? onPressed;
  final double? fontSize;
  final Color? borderColor;
  const PrimayOutlinedButtonWidget({
    super.key,
    this.buttonText,
    this.buttonColor,
    this.bordersRadius,
    this.height,
    this.width,
    this.textColor,
    this.onPressed,
    this.fontSize,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor ?? AppColors.whiteColor,
        side: BorderSide(
          color: borderColor ?? AppColors.primaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(bordersRadius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttonText ?? "",
        style: TextStyle(
          color: textColor ?? AppColors.primaryColor,
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
