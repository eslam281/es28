import 'dart:async';

import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';

import '../core/functions/time_service.dart';
import '../core/shared/snackbar.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{

  StatusRequest statusRequest =StatusRequest.loading;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;

  bool isready = false;
  late Timer rebuild ;
  Position? position;

  String? dateResponse;

  @override
  void onInit() async{
   await gettimes();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isready =true;
      update();
    },);
    // await initializeService();
    FlutterBackgroundService().invoke("setAsBackground");
    super.onInit();
  }

  reTimes()async{

    if(isready){
     await gettimes();
    }
    isready = false;
    update();
    CustomSnackBar("تنببه","انتظر حتى يتم اعاده تشغيل الزر بعد 40 دقيقه");

   rebuild = Timer(const Duration(seconds: 40),() {
     isready =true;
     update();
   },);
  }

  gettimes()async{
    statusRequest =StatusRequest.loading;
    update();
    statusRequest = await times(isready);
    if(statusRequest == StatusRequest.error){
      Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
          backgroundColor: Colors.white);
    }
    await getTimesOff();

    statusRequest =StatusRequest.success;
    update();
  }

  getTimesOff(){
    if(myBox?.get("time") != null)
      data= TimingModel.fromJson(myBox?.get("time"));
      dateResponse =myBox?.get("date")??"";
  }

}