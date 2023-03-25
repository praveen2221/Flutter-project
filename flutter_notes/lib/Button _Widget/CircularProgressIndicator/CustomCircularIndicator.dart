import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomCircularProgressIndicator extends StatefulWidget {
  final double strokeWidth;
  final double radius;
  final Color backgroundColor;
  final Color foregroundColor;
  final double value;

  CustomCircularProgressIndicator({
    required this.strokeWidth,
    required this.radius,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.blue,
    this.value = 0.0,
  });

  @override
  _CustomCircularProgressIndicatorState createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {}); // Rebuild widget on animation update
      });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double percentage = _animationController.value * 1.10;
    return Container(
      child: CustomPaint(
        painter: ProgressPainter(
          strokeWidth: widget.strokeWidth,
          strokeColor: Colors.green,
          backgroundColor: widget.backgroundColor,
          percentage: _animationController.value,
          animationValue: _animationController.value,
        ),
        child: Container(
          height: widget.radius * 2.0,
          width: widget.radius * 2.0,
          child: Center(
            child: Text(
              "${(_animationController.value * 100.0).toInt()}%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.radius / 2.0,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ProgressPainter extends CustomPainter {
  final double strokeWidth;
  final Color strokeColor;
  final Color backgroundColor;
  final double percentage;
  final double animationValue;

  ProgressPainter({
    required this.strokeWidth,
    required this.strokeColor,
    required this.percentage,
    required this.animationValue,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 2.0;
    Offset center = Offset(radius, radius);

    Paint backgroundColorPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2,
        backgroundColorPaint);

    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double startAngle = -math.pi / 2.0;
    double sweepAngle = animationValue * percentage * 2.0 * math.pi;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
