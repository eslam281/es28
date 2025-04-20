import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    Get.snackbar("تحذير","تم رفض أذونات الموقع", backgroundColor: Colors.white);
    return null;
  }

  if (permission == LocationPermission.deniedForever) {
    Get.snackbar("تحذير","تم رفض أذونات الموقع بشكل دائم، ولا يمكننا طلب الأذونات.",backgroundColor: Colors.white);
    return null;
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    await Get.snackbar("تحذير","خدمات الموقع غير مفعلة.",backgroundColor: Colors.white);
    while (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      await Future.delayed(const Duration(seconds: 6));
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }

  }

  return await Geolocator.getCurrentPosition(locationSettings:const LocationSettings(accuracy:LocationAccuracy.best ) );
}