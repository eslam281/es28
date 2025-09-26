import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

abstract class SittingsController extends GetxController{

}
class SittingsControllerImp extends SittingsController{
  double textScaler =myBox?.get("textScaler")??1;
  double textScalerAthkar = myBox?.get("textScalerAthkar")??myBox?.get("textScaler")??1;

  void changeThemeMode()async{
    Get.changeTheme(Get.isDarkMode?
    ThemeData.light(): ThemeData.dark());
    await myBox?.put("theme", Get.isDarkMode?1:2);
    print(myBox?.get("theme"));
    update();
    // Get.appUpdate();
  }
  void changeTextScaler(double val){
    if(textScaler+val<=.8||textScaler+val>=1.42) return;
    textScaler += val;
    print(textScaler);
    myBox?.put("textScaler", textScaler);
    update();
  }
  void changeTextScalerAthkar(double val){
    if(textScalerAthkar+val<=.8||textScalerAthkar+val>=2.91) return;
    textScalerAthkar += val;
    myBox?.put("textScalerAthkar", textScalerAthkar);
    print(textScalerAthkar);
    update();
  }


}