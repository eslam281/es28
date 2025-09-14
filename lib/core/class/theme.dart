
import 'package:flutter/material.dart';

import '../../main.dart';
import '../constant/color.dart';

class MyTheme {

  static ThemeData  lightTheme= ThemeData(
      appBarTheme: const AppBarTheme(titleTextStyle:TextStyle(color:AppColor.black) ,
  elevation: 0,color:AppColor.white,
  iconTheme:IconThemeData(color:AppColor.secondColor)),
    scaffoldBackgroundColor:AppColor.white,
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,),
    textTheme: const TextTheme().apply(
      fontSizeFactor: myBox?.get("textScaler")??1 ,
      fontFamily: 'Cairo',
    ),
  );

  static ThemeData  darkTheme= ThemeData(
      appBarTheme: const AppBarTheme(color:AppColor.black,elevation: 0
  ,iconTheme:IconThemeData(color:AppColor.secondColor)),
    scaffoldBackgroundColor:AppColor.black,
      colorScheme: const ColorScheme.dark(
          brightness: Brightness.dark ),
  );
}