import 'package:flutter_demo_project_batch1/app/modules/SignUp/views/Sign_up.dart';
import 'package:flutter_demo_project_batch1/app/modules/Tabbar/views/tab_bar.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_binding.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_view.dart';
import 'package:flutter_demo_project_batch1/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_demo_project_batch1/app/modules/home/views/home_view_new.dart';
import 'package:flutter_demo_project_batch1/app/modules/homeScreen/home_screen.dart';
import 'package:flutter_demo_project_batch1/app/modules/signin/views/sign_in.dart';
import 'package:get/get.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.homescreen,
      page: () => MyHomePage(),
    ),
    GetPage(
        name: _Paths.dashboard,
        page: () => DashboardScreen(),
        binding: DashboardBinding(),
        children: [
          GetPage(
            name: _Paths.tabbarhome,
            page: () => const TabBarHome(),
          ),
          GetPage(
            name: _Paths.home,
            page: () => HomeView(),
            binding: HomeBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.signin,
      page: () => SignIn(),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => SignUp(),
    ),
  ];
}
