import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:localization_s13/core/constants/app_constants.dart';
import 'package:localization_s13/core/networking/api_endpoints.dart';
import 'package:localization_s13/core/networking/dio_helper.dart';
import 'package:localization_s13/features/home_screen/models/top_headlines_model.dart';

class HomeScreenServices {
  getTopHeadLineApi() async {
    try {
      final Response response = await DioHelper.getRequest(
        endPoint: ApiEndpoints.topHeadLines,
        query: {"apiKey": AppConstants.apiKey, "country": "us"},
      );
      if (response.statusCode == 200) {
        TopHeadLinesModel topHeadLinesModel = TopHeadLinesModel.fromJson(
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
