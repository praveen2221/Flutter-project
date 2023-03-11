import 'package:flutter/material.dart';

class ButtomNavBar extends StatefulWidget {
  const ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Color.fromARGB(255, 40, 205, 238),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 8.0, top: 4.0),
              child: IconButton(
                  icon: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.heat_pump_rounded,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 60),
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8.0, top: 4.0),
              child: IconButton(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
