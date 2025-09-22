import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



Future<void> initializeService()async {
  final service =FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(
          onBackground:onIosBackground
      ),
      androidConfiguration: AndroidConfiguration(onStart:onStart, isForegroundMode: false,)
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
      service.setForegroundNotificationInfo(
        title: "Hisn Muslim",
        content: "Running in background",
      );
      service.setAsForegroundService();
      print("setAsForegroundService=======================================================");

    },);

    service.on('stopService').listen((event) {
      service.stopSelf();
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

