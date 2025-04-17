import 'dart:async';
import 'dart:convert';

import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '../core/class/statusrequest.dart';
import '../core/functions/checkContnection.dart';
import '../core/functions/getlocation.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{

  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;

  bool isready = false;
  late Timer rebuild ;
  Position? position;
  String? timingUrl;
  String? dateResponse;

  @override
  void onInit() {
    times();
    isready =true;
    super.onInit();
  }

  reTimes()async{

    if(isready){
     await times();
    }
    isready = false;

   rebuild = Timer(const Duration(seconds: 40),() {
     isready =true;
     rebuild.cancel();
   },);
  }

  times()async{
    statusRequest =StatusRequest.loading;
    update();

    bool result=false;
    result = await iscontnect();
    bool isondate = checkDate();

    if(result && (!isondate||isready)){

      await reverseGeocode();
      await getdata();
    }else{
      getTimesOff();
    }
    statusRequest =StatusRequest.success;
    update();

  }

  getdata() async{

     if (timingUrl == null){
       timingUrl ="https://api.aladhan.com/v1/timingsByCity?country=Egypt&method=5#";
       Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
           backgroundColor: Colors.white);
     }

     var response = await timeData.getData(timingUrl!);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        data = TimingModel.fromJson(response["data"]["timings"]);
        dateResponse = response["data"]["date"]["gregorian"]["date"];

        sharedpref?.setString("fajr", data!.fajr!);
        sharedpref?.setString("sunrise", data!.sunrise!);
        sharedpref?.setString("dhuhr", data!.dhuhr!);
        sharedpref?.setString("asr", data!.asr!);
        sharedpref?.setString("maghrib", data!.maghrib!);
        sharedpref?.setString("isha", data!.isha!);
        sharedpref?.setString("lastthird", data!.lastthird!);
        sharedpref?.setString("date", dateResponse!);
      } else {
        getTimesOff();
      }

  }

 bool checkDate(){
    dateResponse =sharedpref!.getString("date")??"";
   return dateResponse==DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  getTimesOff(){
    if (sharedpref!.getString("fajr") != null){
      data = TimingModel(
          fajr: sharedpref!.getString("fajr")!,
          sunrise: sharedpref!.getString("sunrise")!,
          dhuhr: sharedpref!.getString("dhuhr")!,
          asr: sharedpref!.getString("asr")!,
          maghrib: sharedpref!.getString("maghrib")!,
          isha: sharedpref!.getString("isha")!,
          lastthird: sharedpref!.getString("lastthird")!
      );
      dateResponse =sharedpref!.getString("date");
    }

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

        timingUrl = "https://api.aladhan.com/v1/timingsByCity?city=${(data["address"]["road"]!=null)?
        data["address"]["road"]:data["address"]["state"]}&country=${data["address"]["country"]}&method=5#";
      } else {

      }
    } catch (e) {

    }
  }

}
// List<Placemark> placemarks =
//     await placemarkFromCoordinates(position.latitude, position.longitude);