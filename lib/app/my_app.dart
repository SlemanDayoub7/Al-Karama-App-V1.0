import 'package:al_karama_app/ui/views/main_view/main_view.dart';
import 'package:al_karama_app/ui/views/splash_view/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:al_karama_app/core/translation/app_translation.dart';
import 'package:al_karama_app/ui/shared/colors.dart';
import 'package:al_karama_app/ui/shared/utils.dart';
import 'package:get/get.dart';

import '../ui/views/landing_view/landing_view.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.blueColorOne,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: getLocal(),
        transitionDuration: Duration(milliseconds: 200),
        defaultTransition: Transition.fadeIn,
        translations: AppTranslation(),
        title: 'AlKarama App V1.0',
        theme: ThemeData(
          fontFamily: "Cairo",
          primarySwatch: Colors.blue,
        ),
        home: SplashView());
  }
}

Locale getLocal() {
  String langCode = storage.getAppLanguage();
  return Locale('ar', 'SA');
  // if (langCode == 'ar')
  //   return Locale('ar', 'SA');
  // else if (langCode == 'en')
  // return Locale('en', 'US');
  // else if (langCode == 'tr')
  //   return Locale('tr', 'TR');
  // else
  //   return Locale('fr', 'FR');
}
