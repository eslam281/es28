
import 'package:flutter/cupertino.dart';

import '../../../core/constant/color.dart';

Widget sectionTitle(String text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.secondColor,
    ),
    textDirection: TextDirection.rtl,
  );
}