
import 'package:flutter/material.dart';

import '../constant/color.dart';

class MyTheme {
  static ThemeData  lightTheme= ThemeData.light().
  copyWith(
      appBarTheme: const AppBarTheme(color:AppColor.black
  ,iconTheme:IconThemeData(color:AppColor.secondColor))
  );
}