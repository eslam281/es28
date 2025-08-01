import 'dart:async';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'alarm_service.dart';



Future<void> initializeService()async {
  final service =FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart:true,onBackground:onIosBackground
      ),
      androidConfiguration: AndroidConfiguration(onStart:onStart,
          isForegroundMode: false,autoStart:false)
  );
}

@pragma('vm:entry-point')
Future<bool>onIosBackground(ServiceInstance service)async{
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart (ServiceInstance service){
  DartPluginRegistrant.ensureInitialized();
  if(service is AndroidServiceInstance){

    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
      // print("setAsForegroundService=======================================================");

    },);

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
      // AndroidAlarmManager.oneShot(const Duration(seconds: 5), 1,alarm,
      AndroidAlarmManager.oneShotAt(DateTime.now().add(
          const Duration(seconds: 20)),
          2,alarm,
          rescheduleOnReboot: true,allowWhileIdle: true,alarmClock: true,
          exact: true,wakeup: true
      );
      print("setAsBackgroundService=======================================================");
    },);


    service.on('stopService').listen((event) {
      service.stopSelf();
      AudioPlayer().stop();
      AndroidAlarmManager.cancel(1);
      AndroidAlarmManager.cancel(2);
    },);
  }

  // Timer.periodic(const Duration(seconds: 5), (timer) async {
  //   if (service is AndroidServiceInstance) {
  //     if (await service.isForegroundService()) {
  //       service.setForegroundNotificationInfo(
  //         title: "Hisn Muslim",
  //         content: "Running in background",
  //       );
  //     }
  //   }
  // });

  // print("onStart==================================================");
  service.invoke('update');
}
void openBatteryOptimizationSettings() {
  final intent = const AndroidIntent(
    action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
    data: 'package:com.example.es28', // استبدل باسم الحزمة الحقيقي لتطبيقك
    flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
  );
  intent.launch();
}