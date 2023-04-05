import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';
import '../Controller/signup_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
