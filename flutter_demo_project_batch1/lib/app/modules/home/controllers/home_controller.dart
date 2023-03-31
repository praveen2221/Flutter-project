import 'dart:convert';

import 'package:flutter_demo_project_batch1/app/data/services/home_repository.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/model/Category.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  List<dynamic> categoryList = [];
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchHomeList();
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
}
