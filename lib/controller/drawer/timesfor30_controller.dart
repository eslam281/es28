import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/timesfor30.dart';
import '../../core/shared/snackbar.dart';
import '../../data/datasource/time_data.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';

class Timesfor30Controller extends GetxController{

  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  List<TimingModel>? data;

  bool isready = false;
  late Timer rebuild ;
  Position? position;
  List locationList =  myBox?.get("location")??["","Cairo"];

  String? dateResponse;

  @override
  void onInit() {
    print(DateTime.now().month);
    if(myBox?.get("timesMonth")!=DateTime.now().month){
      gettimes();
    }else{
      getTimesOff();
    }
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isready =true;
      update();
      });
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
    statusRequest = await Timesfor30.timesfor30(isready);

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
    List? datalist;
    if(myBox?.get("timefor30") != null)
     datalist = myBox?.get("timefor30");
    data = datalist?.map((e) => TimingModel.fromJson(e)).toList();
    dateResponse =myBox?.get("timesMonth")??"";
  }


}