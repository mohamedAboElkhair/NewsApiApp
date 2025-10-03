import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/widgets/article_card_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/top_headline_item_widget.dart';
import 'package:localization_s13/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        toolbarHeight: 68.h,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: AppColors.primaryColor,
          ),
        ],
        title: Text(
          LocaleKeys.Navscreen_explore.tr(),
          style: AppTextStyle.black16Medium.copyWith(
            fontSize: 32.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HightSpaceWidgets(height: 16),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 40.w),
            child: SizedBox(
              height: 40.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  CustomCategoryItemWidget(
                    title: LocaleKeys.Navscreen_travel.tr(),
                  ),

                  CustomCategoryItemWidget(
                    title: LocaleKeys.Navscreen_techonlogy.tr(),
                  ),
                  CustomCategoryItemWidget(
                    title: LocaleKeys.Navscreen_entertainment.tr(),
                  ),
                  CustomCategoryItemWidget(
                    title: LocaleKeys.Navscreen_business.tr(),
                  ),
                ],
              ),
            ),
          ),
          HightSpaceWidgets(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TopHeadlineItemWidget(
                  title: "Apple Unveils Revolutionary AI Features ",
                  authName: "Mohamed AbouElkhair",
                  date: "Oct 3,2025",
                ),
              ],
            ),
          ),
          HightSpaceWidgets(height: 30),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: ListView(
                children: [
                  ArticleCardWidget(
                    title: "sdasds asfsdfsdfsfsffsfsdfsdsfsfsfs sadasdsadasdd",
                    authName: "Mohamed AbouElkhair",
                    date: "Oct 3,2025",
                    imageUrl:
                        "https://b2c-contenthub.com/wp-content/uploads/2025/09/iphone-17-pro.jpg?quality=50&strip=all",
                  ),
                  ArticleCardWidget(
                    title: "Apple Unveils  ",
                    authName: "Mohamed AbouElkhair",
                    date: "Oct 3,2025",
                  ),
                  ArticleCardWidget(
                    title: "Apple Unveils  ",
                    authName: "Mohamed AbouElkhair",
                    date: "Oct 3,2025",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
