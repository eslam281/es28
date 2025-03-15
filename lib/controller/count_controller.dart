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
    i  = sharedpref!.getInt("i")!;
    super.onInit();
  }

  @override
  void dispose() {
    textcontroll.dispose();
    super.dispose();
  }

  void seti (int? val){
    i=val!;
    sharedpref?.setInt("i", i);
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