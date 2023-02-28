import 'package:flutter/material.dart';

class TextStylePrimary extends TextStyle {
  final Color textColor;
  final FontWeight weight;
  final double size;
  final String font;
  final double? lheight;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  const TextStylePrimary(
      {this.textColor = Colors.black,
      this.weight = FontWeight.normal,
      this.overflow = TextOverflow.ellipsis,
      this.size = 12.0,
      this.font = 'Fruitger',
      this.textDecoration = TextDecoration.none,
      this.lheight = 1})
      : super(
            color: textColor,
            fontWeight: weight,
            fontSize: size,
            overflow: overflow,
            height: lheight,
            decoration: textDecoration,
            fontFamily: font);
}

class TextStyleSecondary extends TextStyle {
  final Color textColor;
  final FontWeight weight;
  final double size;
  final String font;
  final double lheight;
  final TextDecoration textDecoration;

  const TextStyleSecondary(
      {this.textDecoration = TextDecoration.none,
      this.textColor = Colors.black,
      this.weight = FontWeight.normal,
      this.size = 12.0,
      this.font = 'Arial',
      this.lheight = 0})
      : super(
            color: textColor,
            fontWeight: weight,
            fontSize: size,
            height: lheight,
            overflow: TextOverflow.ellipsis,
            fontFamily: font,
            decoration: textDecoration);
}
