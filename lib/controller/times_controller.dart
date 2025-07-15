import 'dart:async';
import 'dart:convert';

import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '../core/class/statusrequest.dart';
import '../core/functions/background_service.dart';
import '../core/functions/checkContnection.dart';
import '../core/functions/getlocation.dart';
import '../core/functions/handlingdata.dart';
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
  String? timingUrl;
  String? dateResponse;

  @override
  void onInit() async{
    times();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isready =true;
      update();
    },);
    await initializeService();
    FlutterBackgroundService().invoke("setAsBackground");
    super.onInit();
  }

  reTimes()async{

    if(isready){
     await times();
    }
    isready = false;
    CustomSnackBar("تنببه","انتظر حتى يتم اعاده تشغيل الزر بعد 40 دقيقه");

   rebuild = Timer(const Duration(seconds: 40),() {
     isready =true;
     update();
   },);
  }

  times()async{
    bool isondate =await checkDate();
    if(!isondate||isready){
      statusRequest =StatusRequest.loading;
      update();
      bool result = false;
      result = await iscontnect();

      if (result) {
        await reverseGeocode();
        await getdata();

      } else {
        getTimesOff();
      }

    } else {
      getTimesOff();
    }
    statusRequest =StatusRequest.success;
    update();

  }

  getdata() async{

     if (timingUrl == null){
       timingUrl ="https://api.aladhan.com/v1/timingsByCity?country=Egypt&city=cairo&method=5#";
       Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
           backgroundColor: Colors.white);
     }

     var response = await timeData.getData(timingUrl!);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        data = TimingModel.fromJson(response["data"]["timings"]);
        dateResponse = response["data"]["date"]["gregorian"]["date"];

        myBox?.put("time",data?.toJson());
        myBox?.put("date",dateResponse);

      } else {
        getTimesOff();
      }

  }

  bool checkDate(){
    dateResponse =myBox?.get("date")??"";
   return dateResponse==DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  getTimesOff(){
    if(myBox?.get("time") != null)
      data= TimingModel.fromJson(myBox?.get("time"));
      dateResponse =myBox?.get("date")??"";
  }

  Future<void> reverseGeocode() async {
    position = await determinePosition();
    if(position == null) return;
    final String url = "https://nominatim.openstreetmap.org/reverse?"
        "lat=${position?.latitude}&lon=${position?.longitude}&format=json&accept-language=en";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        timingUrl = "https://api.aladhan.com/v1/timingsByCity?city=${data["address"]["state"]}&country=${data["address"]["country"]}&method=5#";
      } else {

      }
    } catch (e) {

    }
  }

}