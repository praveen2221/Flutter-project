import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final double textSize;
  final VoidCallback? onClick;
  final Size size;
  const CommonButton({
    Key? key,
    required this.title,
    required this.onClick,
    this.size = const Size(double.infinity, 54),
    this.textSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          minimumSize: size),
      child: Text(
        title,
      ),
    );
  }
}
