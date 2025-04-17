import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


import '../core/class/statusrequest.dart';
import '../core/functions/getlocation.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{

  String? timingUrl;
  TimeData timeData = TimeData(Crud());
  bool result=false;
  TimingModel? data;
  StatusRequest statusRequest =StatusRequest.loading;
  Position? position;


  String? date;

  @override
  void onInit() {
    times();
    super.onInit();
  }


  iscontnect()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)) return true ;
    else if(connectivityResult.contains(ConnectivityResult.mobile)) return true ;
    else return false;
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
        date = response["data"]["date"]["gregorian"]["date"];
        print(date);

        sharedpref?.setString("fajr", data!.fajr!);
        sharedpref?.setString("sunrise", data!.sunrise!);
        sharedpref?.setString("dhuhr", data!.dhuhr!);
        sharedpref?.setString("asr", data!.asr!);
        sharedpref?.setString("maghrib", data!.maghrib!);
        sharedpref?.setString("isha", data!.isha!);
        sharedpref?.setString("lastthird", data!.lastthird!);
        sharedpref?.setString("date", date!);
      } else {
        getTimesOff();
      }

  }

  times()async{

    result = await iscontnect();

    if(result){
      await reverseGeocode();
      await getdata();
    }else{
      getTimesOff();
    }
    statusRequest =StatusRequest.success;
    update();

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
      date =sharedpref!.getString("date");
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