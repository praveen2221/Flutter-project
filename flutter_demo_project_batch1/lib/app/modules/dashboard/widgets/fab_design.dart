import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/modules/dashboard/dashboard_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FloatingMenuActionButton extends GetView<DashboardController> {
  const FloatingMenuActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return InkWell(
      onTap: () {
        Navigator.popUntil(controller.context!, (route) {
          return route.isFirst;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green.withOpacity(0.5),
        ),
        child:const Icon( Icons.menu, color: Colors.white, ),
      ),
    );
  }
}
