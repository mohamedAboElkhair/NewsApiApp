import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:localization_s13/core/routing/app_routes.dart';
import 'package:localization_s13/core/styles/App_colors.dart';
import 'package:localization_s13/core/widgets/text_field_widget.dart';
import 'package:localization_s13/generated/locale_keys.g.dart';

class SearchTextFieldWidge extends StatefulWidget {
  const SearchTextFieldWidge({super.key});

  @override
  State<SearchTextFieldWidge> createState() => _SearchTextFieldWidgeState();
}

class _SearchTextFieldWidgeState extends State<SearchTextFieldWidge> {
  bool showTextField = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextField
            ? TextFieldWidget(
                width: 220.w,
                height: 52.h,
                onFieldSumitted: (value) {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.searchResultScreen, extra: value);
                },
                hintText: LocaleKeys.Resultsdate_search.tr(),
              )
            : const SizedBox.shrink(),

        IconButton(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          icon: Icon(Icons.search),
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
