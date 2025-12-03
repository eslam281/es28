import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/timesfor30.dart';
import '../../core/shared/snackbar.dart';
import '../../data/datasource/time_data.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';

class PrayingStatsController extends GetxController{

  List<TimingModel>? timings;
  String? dateResponse;

  @override
  void onInit() {

    if(myBox?.get("timefor30") == null ||
        myBox?.get("timesMonth")!=DateTime.now().month.toString()){

      CustomSnackBar("خطأ","asd");
    }else{
      getTimesOff();

    }
    super.onInit();
  }


  getTimesOff(){
    List? datalist;
    if(myBox?.get("timefor30") != null)
      datalist = myBox?.get("timefor30");
    timings = datalist?.map<TimingModel>((e) => TimingModel.fromJson(e["timings"])).toList();
    dateResponse =myBox?.get("timesMonth")??"";
  }

}