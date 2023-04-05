import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project_batch1/app/data/services/home_repository.dart';
import 'package:get/get.dart';

import '../../../data/model/Category.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<dynamic> categoryList = [];
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchHomeList();
    // insertBusiness();
  }

  Future<void> init() async {
    Get.put(() => HomeController());
  }

  Future<void> sendLocalNotification() async {
    final notificationContent = NotificationContent(
      id: 1,
      channelKey: 'basic_channel',
      title: 'Local Notification',
      body: 'This is a local notification sent from GetX!',
      bigPicture: 'https://picsum.photos/512',
      notificationLayout: NotificationLayout.BigPicture,
    );

    await AwesomeNotifications().createNotification(
      content: notificationContent,
    );
  }

  Future<List<dynamic>> fetchHomeList() async {
    isLoading(true);

    final response = await HomeRepository.instance.getHomeDetails();
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      categoryList = items.map((x) => Category.fromJson(x)).toList();
      isLoading(false);
      return categoryList;
    } else {
      categoryList = [];
      isLoading(false);
      throw Exception('Failed to load items');
    }
  }

  insertBusiness(BuildContext context) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
    };
    Map<String, String> data = {
      "email": "praveen@gmail.com",
      "password": "12345678"
    };

    final response = await HomeRepository.instance.updateHomeDetails();

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);

      print(responseData['success'].toString());
      print(responseData['message'].toString());
      String message = responseData['message'];
      var snackBar = SnackBar(
        content: Text(message),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      return data['success'];
    } else {
      throw Exception('Failed to load items');
    }
  }
}
