import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:localization_s13/core/routing/app_routes.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;
  const ArticleCardWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushNamed(AppRoutes.newsDetalisScreen, extra: article);
      },
      child: Padding(
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
                    article.title ?? "",
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
                    "${article.author} - ${article.publishedAt}" ?? "",
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
                    article.urlToImage ??
                    "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2021/10/breaking-news-india-tv-1632358552-1633394891.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
