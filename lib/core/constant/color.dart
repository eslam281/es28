import 'package:flutter/material.dart';

import '../../main.dart';

class AppColor {
  static const List <Color>listSecondColor =[
     Color(0xff1ac468),
     Color(0xff00c6cf),
    Color(0xffd0e511)
  ];
  static const Color grey = Color(0xffc0c0c0);

  static Color get secondColor =>
      listSecondColor[myBox?.get("secondColorIndex") ?? 0];

  static const Color black = Color(0xFF1E1E1E);
  static const Color white = Color(0xffF2F2F2);

}
