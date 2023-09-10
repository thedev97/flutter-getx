import 'res/routes/routes.dart';
import 'package:get/get.dart';
import 'core/values/strings.dart';
import 'package:flutter/material.dart';
import 'package:job_login_getx/core/languages.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: app_title,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        builder: EasyLoading.init(),
        translations: Languages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        getPages: AppRoutes.appRoutes()
    );
  }
}
