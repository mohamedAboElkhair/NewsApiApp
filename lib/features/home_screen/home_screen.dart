import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:localization_s13/core/constants/app_constants.dart';
import 'package:localization_s13/core/networking/api_endpoints.dart';
import 'package:localization_s13/core/networking/dio_helper.dart';
import 'package:localization_s13/core/routing/app_routes.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';
import 'package:localization_s13/features/home_screen/widgets/article_card_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/top_headline_item_widget.dart';
import 'package:localization_s13/features/home_screen/services/home_screen_services.dart';
import 'package:localization_s13/generated/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      body: FutureBuilder(
        future: HomeScreenServices().getTopHeadLineApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.hasData) {
            NewsModel topHeadLinesModel = snapshot.data! as NewsModel;
            if (topHeadLinesModel.totalResults == 0) {
              return Center(
                child: Text(LocaleKeys.Resultsdate_No_results.tr()),
              );
            }

            return Column(
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
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.Navscreen_travel.tr(),
                            );
                          },
                        ),

                        CustomCategoryItemWidget(
                          title: LocaleKeys.Navscreen_techonlogy.tr(),

                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.Navscreen_techonlogy.tr(),
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: LocaleKeys.Navscreen_entertainment.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.Navscreen_entertainment.tr(),
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: LocaleKeys.Navscreen_business.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.Navscreen_entertainment.tr(),
                            );
                          },
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
                        imageUrl: topHeadLinesModel.articles![0].urlToImage,
                        title: topHeadLinesModel.articles![0].title,
                        authName: topHeadLinesModel.articles![0].author,
                        date: DateFormat(
                          'yyyy-MM-dd - kk:mm',
                        ).format(topHeadLinesModel.articles![0].publishedAt!),
                      ),
                    ],
                  ),
                ),
                HightSpaceWidgets(height: 30),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),

                    child: ListView.builder(
                      itemCount: topHeadLinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadLinesModel.articles![index];
                        return ArticleCardWidget(
                          title: article.title,
                          imageUrl: article.urlToImage,
                          authName: article.author,
                          date: DateFormat(
                            'yyyy-MM-dd - kk:mm',
                          ).format(article.publishedAt!),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Container(child: Center(child: Text("Somthimg wrong")));
        },
      ),
    );
  }
}
