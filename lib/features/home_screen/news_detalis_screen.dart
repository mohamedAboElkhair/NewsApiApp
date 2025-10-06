import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';

class NewsDetalisScreen extends StatelessWidget {
  final Article article;
  const NewsDetalisScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 20,
              height: MediaQuery.of(context).size.height * 0.3,
              child: CachedNetworkImage(imageUrl: article.urlToImage!),
            ),
            Positioned(
              top: 270.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                padding: EdgeInsets.only(top: 24.h, left: 24.w, right: 24.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HightSpaceWidgets(height: 22),
                      Text(
                        article.title.toString(),
                        style: AppTextStyle.black16Medium.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      HightSpaceWidgets(height: 10),
                      Text(
                        "${article.author} - ${DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt!)}" ??
                            "",
                        style: AppTextStyle.grey14Medium,
                      ),
                      HightSpaceWidgets(height: 20),
                      Text(
                        article.description ?? "",
                        style: AppTextStyle.black16Medium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
