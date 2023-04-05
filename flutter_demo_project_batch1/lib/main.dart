import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/constants/strings.dart';
import 'app/routes/app_pages.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic notifications',
        defaultColor: Color(0xFF9D50DD),
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      ),
    ],
  );
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
