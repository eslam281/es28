
import 'package:flutter/material.dart';

import '../constant/color.dart';

class MyTheme {
  static ThemeData  lightTheme= ThemeData(
      appBarTheme: const AppBarTheme(color:AppColor.white
  ,iconTheme:IconThemeData(color:AppColor.secondColor)),
    scaffoldBackgroundColor:AppColor.white,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,),
  );
  static ThemeData  darkTheme= ThemeData(
      appBarTheme: const AppBarTheme(color:AppColor.black
  ,iconTheme:IconThemeData(color:AppColor.secondColor)),
    scaffoldBackgroundColor:AppColor.black,
      colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark ),
  );
}