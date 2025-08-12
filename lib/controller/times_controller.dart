import 'dart:async';

import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';

import '../core/services/time_service.dart';
import '../core/shared/snackbar.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{

  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;

  bool isready = false;
  late Timer rebuild ;
  Position? position;
  List locationList =  myBox?.get("location")??["","Cairo"];

  String? dateResponse;

  @override
  void onInit() async{
    if(myBox?.get("time") == null){
      await gettimes();
    }else{
      getTimesOff();
    }
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isready =true;
      update();
    },);
    // await initializeService();
    // FlutterBackgroundService().invoke("setAsBackground");
    super.onInit();
  }

  reTimes()async{

    if(isready){
     await gettimes();
    }
    isready = false;
    update();
    CustomSnackBar("تنببه","انتظر حتى يتم اعاده تشغيل الزر بعد 40 ثانية");

   rebuild = Timer(const Duration(seconds: 40),() {
     isready =true;
     update();
   },);
  }

  gettimes()async{
    statusRequest =StatusRequest.loading;
    update();
    statusRequest = await times(isready,false);

    if(statusRequest == StatusRequest.error){
      Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
          backgroundColor: Colors.white);
    }else if(statusRequest == StatusRequest.offlinefailure){
      CustomSnackBar("تنببه",
          "انت الان في حاله عدم الاتصال يرجى الاتصال بالانترنت واعاده المحاوله");
    }
    await getTimesOff();
    locationList = await myBox?.get("location")??["","Cairo"];
    statusRequest =StatusRequest.success;
    update();
  }

  getTimesOff(){
    if(myBox?.get("time") != null)
      data= TimingModel.fromJson(myBox?.get("time"));
      dateResponse =myBox?.get("date")??"";
  }

}