import 'dart:async';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
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
      AndroidAlarmManager.oneShotAt(DateTime.now().add(const Duration(seconds: 30)), 1,alarm,
          rescheduleOnReboot: true,allowWhileIdle: true,
          exact: true,wakeup: true
      );
      print("setAsBackgroundService=======================================================");
    },);


    service.on('stopService').listen((event) {
      service.stopSelf();
      AudioPlayer(playerId: "Fajr").stop();
      AndroidAlarmManager.cancel(1);
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
