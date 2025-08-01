


import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';

import '../../core/services/background_service.dart';
import '../../main.dart';

abstract class AlarmController extends GetxController{

}
class AlarmControllerImp extends AlarmController{
  late bool ison ;
  @override
  void onInit() {
    ison = myBox?.get("ison")??false;
    super.onInit();
  }
  onChange(val) async {
    ison = val;
    myBox?.put("ison", ison);
    if(ison==true){
      print("00000000000000000$ison");
      if (!await FlutterBackgroundService().isRunning()) {
        await initializeService();
        await FlutterBackgroundService().startService();
      }
      FlutterBackgroundService().invoke("setAsBackground");
    }else{
      print("00000000000000000$ison");
      FlutterBackgroundService().invoke("stopService");
    }
    update();
  }
}