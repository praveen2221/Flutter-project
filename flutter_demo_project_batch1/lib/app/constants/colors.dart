import 'package:flutter/material.dart';

// class Colors {
//   static Color colorPrimary = const Color(0xFF6F1D46);

//   static Color colorBadge = const Color(0XFFFF0E00);
//   static Color colorDivider = const Color(0XFFF6F3F5);
//   static Color colorFailure = const Color.fromARGB(255, 255, 60, 60);
//   static Color colorGradientDark = const Color(0XFFD6A461);
//   static Color colorGradientLight = const Color(0XFFFFF9EE);
//   static Color colorNormal = const Color(0xFF303030);
//   static Color colorSearchShadow = const Color(0x366F1D46);
//   static Color colorShadowLogin = const Color(0xFFA99A89);
//   static Color colorSuccess = const Color.fromARGB(255, 79, 255, 93);

//   static Color colorTFBackground = const Color(0xFFF4F1F3);
//   static Color colorTFBorder = const Color(0xFF6C1D45);
//   static Color colorTFBorderInactive = const Color(0xFF8692A6);
//   static Color colorTFShadow = const Color(0x8FDECCD5);
//   static Color colorTFTitle = const Color(0x876C1D45);

//   static Color colorCatGradient = const Color(0xFFD6A461);
//   static Color colorCatBorder = const Color(0xFFFFF9EE);
//   static Color colorCatShadow = const Color(0x5C4D1A33);

//   static Color colorTabLabel = const Color(0XFFB5ABB0);
//   static Color colorTextLight = const Color(0XFFD3A8BE);
//   static Color colorCardShadow = const Color(0XFF162233);
//   static Color colorLightText = const Color(0XFF4E4B48);
//   static Color colorCountryShadow = const Color(0XFF162233);
//   static Color colorFliterGradient = const Color(0xFFfbe3c1);
//   static Color colorSettingsText = const Color(0xFF969696);
//   static Color colorFamilyText = const Color(0xFFC4C4C4);
//   static Color colorFamilyIcon = const Color(0xFFADADAD);
//   static Color colorFamilyIconBg = const Color(0xFFF0F0F0);
//   static Color colorHomeShadow = const Color(0xFF676767);
//   static Color colorYellow = const Color(0xFFFABF35);
//   static Color colorBoxGrey = const Color(0xFFF6F6F6);
//   static Color colorStarBg = const Color(0xFFE8E8E8);
//   static Color colorUserType = const Color(0xFFD6A461);
// }

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}
