// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "Auth": {
    "name": "الاسم",
    "email": "البريد الكتروني",
    "password": "كلمه المرور",
    "confirmPassword": "تاكيد كلمه المرور",
    "login": "تسجيل دخول",
    "register": "تسجيل",
    "ForgotPassword": "نسيت كلمه المرور"
  },
  "home_page": "الرئيسيه",
  "Navscreen": {
    "explore": "ستكشف",
    "travel": "السفر",
    "techonlogy": "تكنولوجيا",
    "entertainment": "ترفيه",
    "business": "العمال",
    "cancel": "الغاء",
    "search_result": "نتيجه البحث"
  },
  "Resultsdate": {
    "No_results": "لا توجد نتائج"
  }
};
static const Map<String,dynamic> _en = {
  "Auth": {
    "name": "Name",
    "email": "Email",
    "password": "Password",
    "confirmPassword": "Confirm Password",
    "login": "Login",
    "register": "Register",
    "ForgotPassword": "Forgot Password"
  },
  "home_page": "Home",
  "Navscreen": {
    "explore": "Explore",
    "travel": "Travel",
    "techonlogy": "Techonlogy",
    "business": "Business",
    "entertainment": "Entertainment",
    "cancel": "Cancel",
    "search_result": "Search Result"
  },
  "Resultsdate": {
    "No_results": "No Results"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
