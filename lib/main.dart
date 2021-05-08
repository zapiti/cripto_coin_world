import 'package:crypto_app/page_core/unknown.dart';
import 'package:crypto_app/router/app_page.dart';
import 'package:crypto_app/utils/theme/app_theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'i18n/message.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      translations: Message(),
      defaultTransition: Transition.zoom,
      locale: Locale('en', "US"),debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: AppThemeUtils.colorPrimary,
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
          accentColor: AppThemeUtils.colorPrimary),
      fallbackLocale: Locale('en', "US"),
      getPages: AppPage.list,
      unknownRoute: GetPage(page: () => Unknown(), name: 'notFound'),
    );
  }
}
