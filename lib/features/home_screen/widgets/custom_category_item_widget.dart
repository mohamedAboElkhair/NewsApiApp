import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String? title;
  const CustomCategoryItemWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.only(right: 16.w),
          //padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.appBarColor, width: 1),
            borderRadius: BorderRadius.circular(65.6),
          ),
          child: Text(
            title ?? "",
            style: AppTextStyle.black16Medium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
