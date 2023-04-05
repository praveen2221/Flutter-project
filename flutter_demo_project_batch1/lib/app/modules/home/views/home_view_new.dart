import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final notificationController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Get.offNamed(Routes.signin));
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Obx(() => (controller.isLoading.value == true)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                          leading: const Icon(
                            Icons.umbrella_outlined,
                            color: Colors.purple,
                          ),
                          trailing: InkWell(
                            onTap: () {
                              controller.insertBusiness(context);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.greenAccent,
                            ),
                          ),
                          title: Text(
                              '${controller.categoryList[index].categoryName}'),
                          subtitle: Text(
                              '${controller.categoryList[index].categoryStatus}'),
                          onTap: () {/* react to the tile being tapped */}),
                    ),
                  ],
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          notificationController.sendLocalNotification();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
