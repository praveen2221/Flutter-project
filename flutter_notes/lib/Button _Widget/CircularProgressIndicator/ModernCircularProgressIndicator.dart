import 'package:flutter/material.dart';

class ModernCircularProgressIndicator extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const ModernCircularProgressIndicator({
    Key? key,
    this.size = 50.0,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(color),
            strokeWidth: strokeWidth,
          ),
          SizedBox(
            width: size - strokeWidth * 2,
            height: size - strokeWidth * 2,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: strokeWidth - 1.0,
            ),
          ),
          Icon(
            Icons.check,
            size: size / 2,
            color: color,
          ),
        ],
      ),
    );
  }
}
