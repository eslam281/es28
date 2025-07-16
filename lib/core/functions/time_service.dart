import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../data/datasource/time_data.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';
import '../class/crud.dart';
import '../class/statusrequest.dart';
import 'checkContnection.dart';
import 'getNameOfLocation.dart';
import 'handlingdata.dart';


Future<StatusRequest> times(bool isready)async{
  StatusRequest statusRequest =StatusRequest.onitnial;
  bool isondate =await checkDate();

  if(!isondate||isready){
    bool result = false;
    result = await iscontnect();

    if (result) {
      statusRequest = await getdata();
    }
  }
  return statusRequest;
}

Future<StatusRequest> getdata() async{
  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  String? timingUrl= await reverseGeocode();
  TimingModel? data;
  String? dateResponse;

  if (timingUrl == ""){
    timingUrl ="https://api.aladhan.com/v1/timingsByCity?country=Egypt&city=cairo&method=5#";
    statusRequest = StatusRequest.error;
  }

  var response = await timeData.getData(timingUrl);

  statusRequest = await handlingData(response);
  if (statusRequest == StatusRequest.success) {
    data = TimingModel.fromJson(response["data"]["timings"]);
    dateResponse = response["data"]["date"]["gregorian"]["date"];

    myBox?.put("time",data.toJson());
    myBox?.put("date",dateResponse);
  }

  return statusRequest;
}

Future<bool> checkDate()async{
  String? dateResponse;
  dateResponse =await myBox?.get("date")??"";
  return dateResponse==DateFormat('dd-MM-yyyy').format(DateTime.now());
}
