import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

abstract class SittingsController extends GetxController{

}
class SittingsControllerImp extends SittingsController{

  changeThemeMode()async{
    Get.changeTheme(Get.isDarkMode?
    ThemeData.light(): ThemeData.dark());
    await myBox?.put("theme", Get.isDarkMode?1:2);
    print(myBox?.get("theme"));
    update();
    // Get.appUpdate();
  }


}