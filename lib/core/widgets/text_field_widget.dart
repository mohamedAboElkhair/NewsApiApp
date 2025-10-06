import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final Widget? suffixTcon;
  final double? width;
  final bool? isPassword;
  final TextInputType? keyBoardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final double? height;
  final Function(String)? onFieldSumitted;
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.suffixTcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.keyBoardType,
    this.maxLines,
    this.height,
    this.onFieldSumitted,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      height: height ?? 80,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        controller: controller ?? TextEditingController(),
        keyboardType: keyBoardType ?? TextInputType.text,
        onFieldSubmitted: onFieldSumitted,
        validator: validator,
        cursorColor: AppColors.primaryColor,
        autofocus: false,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xff8391A1),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 18.h),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: const Color(0xffEBECF4), width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),

          filled: true,
          fillColor: AppColors.whiteColor,
          suffixIcon: suffixTcon,
        ),
      ),
    );
  }
}
