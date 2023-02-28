import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math.dart' as v_math;

typedef OnChange = void Function(int index);

class StarRating extends StatefulWidget {
  const StarRating({
    Key? key,
    required this.onChange,
    this.initialValue = 2,
    this.options = const ['Terrible', 'Bad', 'Okay', 'Good', 'Great'],
    this.optionStyle,
    this.width,
    this.circleDiameter = 60,
  })  : assert(
          initialValue >= 0 && initialValue <= 4,
          'Initial value should be between 0 and 4',
        ),
        assert(
          options.length == 5,
          'Reviews options should be 5',
        ),
        super(key: key);

  final OnChange onChange;
  final int initialValue;
  final List<String> options;
  final TextStyle? optionStyle;
  final double? width;
  final double circleDiameter;
  @override
  StarRatingState createState() => StarRatingState();
}

class StarRatingState extends State<StarRating>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late double _animationValue;
  late double _xOffset;

  late AnimationController _controller;
  late Tween<double> _tween;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    var initValue = widget.initialValue.toDouble();
    _controller = AnimationController(
      value: initValue,
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _tween = Tween(end: initValue);
    _animation = _tween.animate(
      CurvedAnimation(
        curve: Curves.easeIn,
        parent: _controller,
      ),
    )..addListener(() {
        setState(() {
          _animationValue = _animation.value;
        });
      });
    _animationValue = initValue;
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  _afterLayout(_) {
    widget.onChange(widget.initialValue);
  }

  void handleTap(int state) {
    _controller.duration = const Duration(milliseconds: 400);
    _tween.begin = _tween.end;
    _tween.end = state.toDouble();
    _controller.reset();
    _controller.forward();

    widget.onChange(state);
  }

  void _onDrag(double dx, innerWidth) {
    var newAnimatedValue = _calcAnimatedValueFormDragX(dx, innerWidth);

    if (newAnimatedValue > 0 && newAnimatedValue < widget.options.length - 1) {
      setState(
        () {
          _animationValue = newAnimatedValue;
        },
      );
    }
  }

  void _onDragEnd(_) {
    _controller.duration = const Duration(milliseconds: 100);
    _tween.begin = _animationValue;
    _tween.end = _animationValue.round().toDouble();
    _controller.reset();
    _controller.forward();

    widget.onChange(_animationValue.round());
  }

  void _onDragStart(x, width) {
    var oneStepWidth =
        (width - widget.circleDiameter) / (widget.options.length - 1);
    _xOffset = x - (oneStepWidth * _animationValue);
  }

  _calcAnimatedValueFormDragX(x, innerWidth) {
    x = x - _xOffset;
    return x /
        (innerWidth - widget.circleDiameter) *
        (widget.options.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingSize),
      child: LayoutBuilder(
        builder: (context, size) {
          return Stack(
            children: <Widget>[
              MeasureLine(
                states: widget.options,
                handleTap: handleTap,
                animationValue: _animationValue,
                width: widget.width != null && widget.width! < size.maxWidth
                    ? widget.width!
                    : size.maxWidth,
                optionStyle: widget.optionStyle,
                circleDiameter: widget.circleDiameter,
              ),
              MyIndicator(
                circleDiameter: widget.circleDiameter,
                animationValue: _animationValue,
                width: widget.width != null && widget.width! < size.maxWidth
                    ? widget.width
                    : size.maxWidth,
                onDragStart: (details) {
                  _onDragStart(
                      details.globalPosition.dx,
                      widget.width != null && widget.width! < size.maxWidth
                          ? widget.width
                          : size.maxWidth);
                },
                onDrag: (details) {
                  _onDrag(
                      details.globalPosition.dx,
                      widget.width != null && widget.width! < size.maxWidth
                          ? widget.width
                          : size.maxWidth);
                },
                onDragEnd: _onDragEnd,
              ),
            ],
          );
        },
      ),
    );
  }
}

const double paddingSize = 10;

class MeasureLine extends StatelessWidget {
  const MeasureLine({
    super.key,
    required this.handleTap,
    required this.animationValue,
    required this.states,
    required this.width,
    this.optionStyle,
    required this.circleDiameter,
  });

  final double animationValue;
  final Function handleTap;
  final List<String> states;
  final double width;
  final TextStyle? optionStyle;
  final double circleDiameter;
  List<Widget> _buildUnits() {
    var res = <Widget>[];
    var animatingUnitIndex = animationValue.round();
    var unitAnimatingValue = (animationValue * 10 % 10 / 10 - 0.5).abs() * 2;

    states.asMap().forEach((index, text) {
      var scale = 0.9;
      if (animatingUnitIndex == index) {
        scale = (1 - unitAnimatingValue) * 0.7;
      }
      res.add(LimitedBox(
        key: ValueKey(text),
        maxWidth: circleDiameter,
        child: GestureDetector(
          onTap: () {
            handleTap(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Transform.scale(
                scale: scale,
                child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/star_grey.png"),
                          fit: BoxFit.cover),
                    ),
                    child: Stack(
                      children: [
                        const Head(
                          color: Color(0xFFFFFFFF),
                          circleDiameter: 10,
                        ),
                        Face(
                          circleDiameter: 60,
                          color: const Color(0xFFC6C6C6),
                          animationValue: index.toDouble(),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ));
    });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildUnits(),
    );
  }
}

class Face extends StatelessWidget {
  const Face({
    super.key,
    this.color = const Color(0xFFBB8300),
    required this.animationValue,
    required this.circleDiameter,
  });

  final double animationValue;
  final Color color;
  final double circleDiameter;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: circleDiameter,
      width: circleDiameter,
      child: CustomPaint(
        size: const Size(300, 300),
        painter: MyPainter(animationValue, color: color),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter(
    animationValue, {
    this.color = const Color(0xFF615f56),
  })  : activeIndex = animationValue.floor(),
        unitAnimatingValue = (animationValue * 10 % 10 / 10);

  final int activeIndex;
  Color color;
  final double unitAnimatingValue;

  @override
  void paint(Canvas canvas, Size size) {
    _drawEye(canvas, size);
    _drawMouth(canvas, size);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return unitAnimatingValue != oldDelegate.unitAnimatingValue ||
        activeIndex != oldDelegate.activeIndex;
  }

  _drawEye(canvas, size) {
    var angle = 0.0;
    var wide = 0.0;

    switch (activeIndex) {
      case 0:
        angle = 55 - unitAnimatingValue * 50;
        wide = 80.0;
        break;
      case 1:
        wide = 80 - unitAnimatingValue * 80;
        angle = 5;
        break;
    }
    var degree1 = 90 * 3 + angle;
    var degree2 = 90 * 3 - angle + wide;
    var x1 = size.width / 2 * 0.8;
    var x2 = size.width - x1;
    var y = size.height * 0.41;
    var eyeRadius = 2.49;

    var paint = Paint()..color = color;
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(x1, y),
        radius: eyeRadius,
      ),
      v_math.radians(degree1),
      v_math.radians(360 - wide),
      false,
      paint,
    );
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(x2, y),
        radius: eyeRadius,
      ),
      v_math.radians(degree2),
      v_math.radians(360 - wide),
      false,
      paint,
    );
  }

  _drawMouth(Canvas canvas, size) {
    var upperY = size.height * 0.65;
    var lowerY = size.height * 0.70;
    var middleY = (lowerY - upperY) / 2 + upperY;

    var leftX = size.width / 2 * 0.8;
    var rightX = size.width - leftX;
    var middleX = size.width / 2;

    late double y1, y3, x2, y2;
    Path? path2;
    switch (activeIndex) {
      case 0:
        y1 = lowerY;
        x2 = middleX;
        y2 = upperY;
        y3 = lowerY;
        break;
      case 1:
        y1 = lowerY;
        x2 = middleX;
        y2 = unitAnimatingValue * (middleY - upperY) + upperY;
        y3 = lowerY - unitAnimatingValue * (lowerY - upperY);
        break;
      case 2:
        y1 = unitAnimatingValue * (upperY - lowerY) + lowerY;
        x2 = middleX;
        y2 = unitAnimatingValue * (lowerY + 3 - middleY) + middleY;
        y3 = upperY;
        break;
      case 3:
        y1 = upperY;
        x2 = middleX;
        y2 = lowerY + 3;
        y3 = upperY;
        path2 = Path()
          ..moveTo(leftX, y1)
          ..quadraticBezierTo(
            x2,
            y2,
            upperY - 2.5,
            y3 - 2.5,
          )
          ..quadraticBezierTo(
            x2,
            y2 - unitAnimatingValue * (y2 - upperY + 2.5),
            leftX,
            upperY - 2.5,
          )
          ..close();
        break;
      case 4:
        y1 = upperY;
        x2 = middleX;
        y2 = lowerY + 3;
        y3 = upperY;
        path2 = Path()
          ..moveTo(leftX, y1)
          ..quadraticBezierTo(
            x2,
            y2,
            upperY - 2.5,
            y3 - 2.5,
          )
          ..quadraticBezierTo(
            x2,
            upperY - 2.5,
            leftX,
            upperY - 2.5,
          )
          ..close();
        break;
    }
    var path = Path()
      ..moveTo(leftX, y1)
      ..quadraticBezierTo(
        x2,
        y2,
        rightX,
        y3,
      );

    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 5);

    if (path2 != null) {
      canvas.drawPath(
        path2,
        Paint()
          ..color = color
          ..style = PaintingStyle.fill
          ..strokeCap = StrokeCap.round,
      );
    }
  }
}

// ignore: must_be_immutable
class MyIndicator extends StatelessWidget {
  MyIndicator({
    super.key,
    required this.animationValue,
    required width,
    required this.onDrag,
    required this.onDragStart,
    required this.onDragEnd,
    required this.circleDiameter,
  })  : width = width - circleDiameter,
        possition = animationValue == 0 ? 0 : animationValue / 4;

  final double animationValue;
  final Function(DragUpdateDetails) onDrag;
  final Function(DragEndDetails) onDragEnd;
  final Function(DragStartDetails) onDragStart;
  final double possition;
  final double width;
  final double circleDiameter;
  var scale = 0.9;
  _buildIndicator() {
    return GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDrag,
      onHorizontalDragEnd: onDragEnd,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Transform.scale(
            scale: scale,
            child: Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/star.png"),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  const Head(
                    color: Color(0xFFFFFFFF),
                    hasShadow: true,
                    circleDiameter: 10,
                  ),
                  Face(
                    animationValue: animationValue,
                    circleDiameter: 60,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: width * possition,
      child: _buildIndicator(),
    );
  }
}

class Head extends StatelessWidget {
  const Head({
    super.key,
    this.color = const Color(0xFFc9ced2),
    this.hasShadow = false,
    required this.circleDiameter,
  });

  final Color color;
  final bool hasShadow;
  final double circleDiameter;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleDiameter,
      width: circleDiameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
