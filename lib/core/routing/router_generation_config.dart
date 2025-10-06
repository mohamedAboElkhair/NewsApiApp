import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:localization_s13/core/routing/app_routes.dart';
import 'package:localization_s13/features/home_screen/home_screen.dart';
import 'package:localization_s13/features/search_result_screen/search_result_screen.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.homeScreen,
    routes: [
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (context, state) {
       //   String query = state.extra as String;
          return Container();
        },
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return SearchResultScreen(query: query);
        },
      ),
      GoRoute(
        path: AppRoutes.articleNewsScreen,
        name: AppRoutes.articleNewsScreen,
        builder: (context, state) => Container(),
      ),

      //      GoRoute(
      //   path: AppRoutes.itemDetsilsScreen,
      //   name: AppRoutes.itemDetsilsScreen,
      //   builder: (context, state) {
      //     ItemModel item = state.extra as ItemModel;
      //     return ItemDetailsScreen(itemModel: item);
      //   },
      // ),
    ],
  );
}
