import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localization_s13/core/styles/App_colors.dart';

class AppTextStyle {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle onBoardingDescriptionStyle = GoogleFonts.inter(
    fontSize: 13.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteColor,
  );
  static TextStyle white14samibold = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
  static TextStyle black16Medium = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static TextStyle grey14Medium = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    color: const Color(0xff878787),
  );
}
