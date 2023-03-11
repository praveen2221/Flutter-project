import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;

  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
  });

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / widget.length * widget.index;
    final difference = (widget.position - desiredPosition).abs();
    final verticalAlignment = 1 - widget.length * difference;
    final opacity = widget.length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          widget.onTap(widget.index);
        },
        child: Container(
            height: 75.0,
            child: Transform.translate(
              offset: Offset(
                  0,
                  difference < 1.0 / widget.length
                      ? verticalAlignment * 40
                      : 0),
              child: Opacity(
                  opacity:
                      difference < 1.0 / widget.length * 0.99 ? opacity : 1.0,
                  child: widget.child),
            )),
      ),
    );
  }
}
