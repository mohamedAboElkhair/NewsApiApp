import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:localization_s13/core/routing/app_routes.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/styles/App_text_style.dart';
import 'package:localization_s13/core/widgets/space_widgets.dart.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';
import 'package:localization_s13/features/home_screen/widgets/article_card_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:localization_s13/features/home_screen/widgets/top_headline_item_widget.dart';
import 'package:localization_s13/features/search_result_screen/services/search_result_services.dart';
import 'package:localization_s13/generated/locale_keys.g.dart';

class SearchResultScreen extends StatelessWidget {
  String query;
  SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
        title: Text(
          LocaleKeys.Navscreen_search_result.tr(),
          style: AppTextStyle.black16Medium.copyWith(fontSize: 20),
        ),
      ),
      body: FutureBuilder(
        future: SearchResultServices().searchItemByName(query),
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
                HightSpaceWidgets(height: 30),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),

                    child: ListView.builder(
                      itemCount: topHeadLinesModel.articles!.length,
                      itemBuilder: (context, index) {
                        Article article = topHeadLinesModel.articles![index];
                        return ArticleCardWidget(article: article);
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
