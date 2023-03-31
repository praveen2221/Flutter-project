import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Home Page"),
      ),
      body: Obx(() => (controller.isLoading.value == true)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.categoryList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                      leading: const Icon(
                        Icons.umbrella_outlined,
                        color: Colors.purple,
                      ),
                      trailing: InkWell(
                        onTap: () {},
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
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      //  Text(businessData?.businessName ?? "")
      // ListView.builder(
      //   itemCount: categoryList.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(categoryList[index].categoryName.toString()),
      //       subtitle: Text(categoryList[index].categoryStatus.toString()),
      //     );
      //   },
      // ),
    );
  }
}
