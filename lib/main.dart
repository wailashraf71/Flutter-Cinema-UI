import 'package:cinema/ui/App.dart';
import 'package:cinema/ui/components/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

void main(){
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
//      Locale('en', 'US'),
      Locale('ar', 'IQ')
    ],
    path: 'assets/languages',
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: color1,
        systemNavigationBarColor: color1
    ));

    return MaterialApp(
      title: 'Al Madar ISP',
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      theme: mainThemeDark(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      home: App(),
    );
  }
}