import 'package:flutter/material.dart';

import '../../main.dart';

class AppColor {
  static const List<Color> listSecondColor = [
    Color(0xff1ac468), // Green
    Color(0xff00c6cf), // Cyan
    Color(0xffd0e511), // Yellow/Lime
    Color(0xff8e44ad), // Deep Purple
    Color(0xff2980b9), // Royal Blue
    Color(0xffe67e22), // Orange/Amber
    Color(0xffe74c3c), // Red
    Color(0xff1abc9c), // Turquoise
    Color(0xfffd79a8), // Pink
  ];
  static const Color grey = Color(0xffc0c0c0);

  static Color get secondColor =>
      listSecondColor[myBox?.get("secondColorIndex") ?? 0];

  static const Color black = Color(0xFF1E1E1E);
  static const Color white = Color(0xffF2F2F2);

}
