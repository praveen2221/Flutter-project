import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_binding.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_view.dart';
import 'package:flutter_demo_project_batch1/app/modules/home/views/home_view_new.dart';
import 'package:get/get.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
      GetPage(
        name: _Paths.dashboard,
        page: () => DashboardScreen(),
        binding: DashboardBinding(),
        children: [ 
            GetPage(
            name: _Paths.home,
            page: () => const HomeView(),
          ),
        ] ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
    ),
  ];
}
