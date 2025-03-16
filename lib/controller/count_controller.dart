import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';

abstract class CountController extends GetxController{

}
class CountControllerImp extends CountController{
  int i = 0;
  String counter="ادخل الذكر ";

  late TextEditingController textcontroll;

  @override
  void onInit() {
    textcontroll = TextEditingController();
     if( sharedpref!.getInt("i") != null)
    i  = sharedpref!.getInt("i")!;
    super.onInit();
  }

  @override
  void dispose() {
    textcontroll.dispose();
    super.dispose();
  }

  void seti (){
    i=0;
    sharedpref?.setInt("i", 0);
    update();
  }
  void setCounter (String? val){
    counter=val!;
    sharedpref?.setString("counter", counter);
    update();
  }
  void Addi (){
    i++;
    sharedpref?.setInt("i", i);
    update();
  }

}