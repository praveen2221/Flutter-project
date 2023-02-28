import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/modules/home/views/home_view_new.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../dashboard_controller.dart';

class BottomNavBar extends GetView<HomeController> {
  BottomNavBar({Key? key}) : super(key: key);
  final dashboardController = Get.find<DashboardController>();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.green,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 8.0, top: 4.0),
              child: IconButton(
                  icon:Icon( Icons.home, color: Colors.white, ),
                  onPressed: () {
                   
                    Navigator.push(
                        dashboardController.context!,
                        MaterialPageRoute(
                            builder: (_) => const HomeView()));
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: Icon( Icons.heat_pump_rounded, color: Colors.white, ),
                onPressed: () {
                  Navigator.of(dashboardController.context!).push(
                      MaterialPageRoute(builder: (_) => HomeView()));
                },
              ),
            ),
            const SizedBox(width: 60),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: Icon( Icons.settings, color: Colors.white, ),
                onPressed: () {
                   Navigator.of(dashboardController.context!).push(
                      MaterialPageRoute(builder: (_) => HomeView()));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0, top: 4.0),
              child: IconButton(
                icon: Icon( Icons.lock, color: Colors.white, ),
                onPressed: () {
                   Navigator.of(dashboardController.context!).push(
                      MaterialPageRoute(builder: (_) => HomeView()));
                },
              ),
            ),
          ],
        ));
  }
}

class CircularNotched extends NotchedShape {
  const CircularNotched();
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null || !host.overlaps(guest)) return Path()..addRect(host);

    Path path = Path();
    final double xScaling = host.width / 390;
    final double yScaling = host.height / 64;
    path.lineTo(129.48 * xScaling, 0 * yScaling);
    path.cubicTo(
      73.8011 * xScaling,
      0.00000864955 * yScaling,
      0 * xScaling,
      0.383933 * yScaling,
      0 * xScaling,
      0.383933 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      0.383933 * yScaling,
      0 * xScaling,
      64 * yScaling,
      0 * xScaling,
      64 * yScaling,
    );
    path.cubicTo(
      0 * xScaling,
      64 * yScaling,
      390 * xScaling,
      64 * yScaling,
      390 * xScaling,
      64 * yScaling,
    );
    path.cubicTo(
      390 * xScaling,
      64 * yScaling,
      390 * xScaling,
      0.383933 * yScaling,
      390 * xScaling,
      0.383933 * yScaling,
    );
    path.cubicTo(
      390 * xScaling,
      0.383933 * yScaling,
      315.129 * xScaling,
      0.00000416538 * yScaling,
      256.88 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      228.8 * xScaling,
      -0.00000200799 * yScaling,
      222.04 * xScaling,
      27.5924 * yScaling,
      195 * xScaling,
      27.5924 * yScaling,
    );
    path.cubicTo(
      167.96 * xScaling,
      27.5924 * yScaling,
      159.12 * xScaling,
      -0.00000460449 * yScaling,
      129.48 * xScaling,
      0 * yScaling,
    );
    path.cubicTo(
      129.48 * xScaling,
      0 * yScaling,
      129.48 * xScaling,
      0 * yScaling,
      129.48 * xScaling,
      0 * yScaling,
    );
    return path..close();
  }
}
