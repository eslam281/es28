import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Get.snackbar("تحذير","خدمات الموقع غير مفعلة.",backgroundColor: Colors.white);

    await Geolocator.openLocationSettings();
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled) return null;
  }

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

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}