import 'package:flutter_demo_project_batch1/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../controllers/sign_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
