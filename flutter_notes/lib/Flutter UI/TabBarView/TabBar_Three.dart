import 'package:flutter/material.dart';

import '../../Home_Screen_Buttons.dart';

class TabBarThree extends StatefulWidget {
  const TabBarThree({super.key, required this.title});

  final String title;

  @override
  State<TabBarThree> createState() => _TabBarThreeState();
}

class _TabBarThreeState extends State<TabBarThree>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("TabBar"),
            backgroundColor: Colors.black,
          ),
          body: Column(
            children: [
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [new BoxShadow(blurRadius: 30.0)],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 30.0)),
                ),
                child: TabBarThree(),
              ),
              TabBarview(),
            ],
          )),
    );
  }

  Expanded TabBarview() {
    return const Expanded(
        child: TabBarView(
      children: [
        Center(
          child: Text("Chats Pages"),
        ),
        Center(
          child: Text("Status Pages"),
        ),
        Center(
          child: Text('Calls Page'),
        ),
        Center(
          child: Text('Settings Page'),
        )
      ],
    ));
  }

  TabBar TabBarThree() {
    return TabBar(
      padding: const EdgeInsets.only(bottom: 20),
      indicator: BoxDecoration(
          color: Colors.green[300], borderRadius: BorderRadius.circular(30.0)),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      tabs: const [
        Tab(
          text: 'Chats',
        ),
        Tab(
          text: 'Status',
        ),
        Tab(
          text: 'Calls',
        ),
        Tab(
          text: 'Settings',
        )
      ],
    );
  }
}
