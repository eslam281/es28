import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

iscontnect()async{
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  if(connectivityResult.contains(ConnectivityResult.wifi)) return true ;
  else if(connectivityResult.contains(ConnectivityResult.mobile)) return true ;
  else {
    Get.snackbar("تنببه","انت الان في حاله عدم الاتصال يرجى  \nالاتصال بالانترنت واعاده المحاوله",
        backgroundColor: Colors.white);
    return false;
  }
}