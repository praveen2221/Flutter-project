import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key, required this.title});

  final String title;

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 150, 243, 1),
        title: const Text("Tab Bar"),
        bottom: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Colors.greenAccent),
          isScrollable: true,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.cloud_outlined),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
            Tab(
              icon: Icon(Icons.flight),
            ),
            Tab(
              icon: Icon(Icons.directions_transit),
            ),
            Tab(
              icon: Icon(Icons.directions_car),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Icon(Icons.cloud, size: 350),
          ),
          Center(
            child: Icon(Icons.beach_access_sharp, size: 350),
          ),
          Center(
            child: Icon(Icons.brightness_5_sharp, size: 350),
          ),
          Center(
            child: Icon(Icons.flight, size: 350),
          ),
          Center(
            child: Icon(Icons.directions_transit, size: 350),
          ),
          Center(
            child: Icon(Icons.directions_car, size: 350),
          ),
        ],
      ),
    );
  }
}
