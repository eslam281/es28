import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../data/datasource/time_data.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';
import '../class/crud.dart';
import '../class/statusrequest.dart';
import 'checkContnection.dart';
import 'getNameOfLocation.dart';
import 'handlingdata.dart';

StatusRequest statusRequest =StatusRequest.loading;
TimeData timeData = TimeData(Crud());
TimingModel? data;

bool isready = false;
String? timingUrl;
String? dateResponse;

times()async{
  bool isondate =await checkDate();
  if(!isondate||isready){

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