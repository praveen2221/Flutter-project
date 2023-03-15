// ignore: file_names
import 'package:flutter/material.dart';

import '../DateTimePicker/Date_Time_Picker.dart';
import '../Text_Form_Field.dart/Text_form_field.dart';
import 'TabBarButton/TabBar_Button1.dart';

class MyTabBarView extends StatefulWidget {
  const MyTabBarView({super.key, required this.title});

  final String title;

  @override
  State<MyTabBarView> createState() => _MyTabBarViewState();
}

class _MyTabBarViewState extends State<MyTabBarView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab Bar"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.login_sharp),
            ),
            Tab(
              icon: Icon(Icons.check_box),
            ),
            Tab(
              icon: Icon(Icons.calendar_view_month),
            ),
          ],
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Center(
              child: MyTextFormField(),
            ),
            Center(
              child: MyTabBarButton1(
                title: 'screen two',
              ),
            ),
            Center(
              child: DateTimePickerPage(),
            ),
          ],
        ),
      ),
    );
  }
}
