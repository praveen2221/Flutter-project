import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/constants/strings.dart';
import 'app/routes/app_pages.dart';
main() async {
 
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "Demo App",
      translations: AppString(),
      locale: const Locale('en', 'US'),
      theme: ThemeData(
          unselectedWidgetColor: Colors.white,
          fontFamily: 'Fruitger',
          primaryColor: Colors.white),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
