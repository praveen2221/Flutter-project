import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_controller.dart';
import 'package:flutter_demo_project_batch1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'widgets/bottom_bar.dart';
import 'widgets/fab_design.dart';

class DashboardScreen extends GetView<DashboardController> {
  final navigatorKey = GlobalKey<NavigatorState>();
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: const FloatingMenuActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(),
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          return !await navigatorKey.currentState!.maybePop();
        },
        child: SafeArea(
          child: Navigator(
            key: navigatorKey,
            initialRoute: Routes.home,
            onGenerateInitialRoutes: (navigatorState, initialRoute) {
              controller.context = navigatorState.context;
              return [
                MaterialPageRoute(
                    builder: ((context) => AppPages.routes[1].children
                        .firstWhere(
                            (element) => element.name == Routes.tabbarhome)
                        .page()))
              ];
            },
            onGenerateRoute: ((routeSettings) {
              return MaterialPageRoute(
                builder: (context) => AppPages.routes[1].children
                    .firstWhere((element) => element.name == routeSettings.name)
                    .page(),
              );
            }),
            onPopPage: (route, result) {
              return route.isFirst ? false : true;
            },
          ),
        ),
      ),
    );
  }
}
