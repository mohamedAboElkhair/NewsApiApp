import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:localization_s13/core/constants/app_constants.dart';
import 'package:localization_s13/core/networking/api_endpoints.dart';
import 'package:localization_s13/core/networking/dio_helper.dart';
import 'package:localization_s13/features/home_screen/models/news_api.dart';

class SearchResultServices {
  searchItemByName(String query) async {
    try {
      final Response response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.searchEndpoint,
        query: {"apiKey": AppConstants.apiKey, "q": query},
      );
      if (response.statusCode == 200) {
        NewsModel topHeadLinesModel = NewsModel.fromJson(
          response.data,
        );
        // log(topHeadLinesModel.totalResults.toString());
        return topHeadLinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
  }

}