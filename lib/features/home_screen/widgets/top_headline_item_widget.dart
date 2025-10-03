import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';

class TopHeadlineItemWidget extends StatelessWidget {
  final String? title;
  final String? authName;
  final String? date;
  final String? imageUrl;
  const TopHeadlineItemWidget({
    super.key,
    this.date,
    this.authName,
    this.imageUrl,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              height: 206.h,
              imageUrl:
                  imageUrl ??
                  "https://i0.wp.com/newsdata.io/blog/wp-content/uploads/2024/01/Snipaste_2021-11-28_13-55-49.jpg?fit=701%2C351&ssl=1",
              fit: BoxFit.fill,
              // height: 207.h,
            ),
          ),
        ),
        HightSpaceWidgets(height: 16),
        Text(
          title ?? "",
          style: AppTextStyle.black16Medium.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        HightSpaceWidgets(height: 10),
        Text("$authName - $date" ?? "", style: AppTextStyle.grey14Medium),
      ],
    );
  }
}
