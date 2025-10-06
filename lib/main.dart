import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization_s13/core/constants/app_constants.dart';
import 'package:localization_s13/core/networking/dio_helper.dart';
import 'package:localization_s13/core/routing/router_generation_config.dart';
import 'package:localization_s13/generated/codegen_loader.g.dart';
import 'package:localization_s13/generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.initDio();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path:
          'assets/translations', // <-- change the path of the translation files
      assetLoader:
          CodegenLoader(), // fix error use : flutter pub run easy_localization:generate --source-dir ./assets/translations
      //then : flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
      fallbackLocale: Locale('ar'),
      startLocale: Locale(AppConstants.lang),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'News App',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,

          routerConfig: RouterGenerationConfig.goRouter,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   void _changeLanguage() {
//     if (context.locale == Locale("en")) {
//       context.setLocale(Locale('ar'));
//     } else {
//       context.setLocale(Locale('en'));
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '${context.locale.languageCode} - ${context.locale.countryCode}',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             Text(
//               LocaleKeys.Auth_name.tr(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),

//             Text(
//               'Auth.name'.tr(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             Text(
//               'Auth.email'.tr(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _changeLanguage,
//         tooltip: 'Chenge Language',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
