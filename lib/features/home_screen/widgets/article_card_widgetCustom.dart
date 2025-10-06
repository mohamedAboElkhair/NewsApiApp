import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';

class ArticleCardWidget extends StatelessWidget {
  final String? title;
  final String? authName;
  final String? date;
  final String? imageUrl;
  //final Article? article;
  const ArticleCardWidget({
    super.key,
    this.authName,
    this.date,
    this.imageUrl,
    this.title,
 //   this.article
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238.w,
                child: Text(
                  maxLines: 2,
                  title ?? "",
                  style: AppTextStyle.black16Medium.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              HightSpaceWidgets(height: 10),
              SizedBox(
                width: 238.w,
                child: Text(
                  "$authName - $date" ?? "",
                  style: AppTextStyle.grey14Medium,
                ),
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: 122,
              height: 80.h,
              imageUrl:
                  imageUrl ??
                  "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2021/10/breaking-news-india-tv-1632358552-1633394891.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
