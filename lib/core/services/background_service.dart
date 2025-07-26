import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../class/statusrequest.dart';
import 'time_service.dart';



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
      print("setAsForegroundService=======================================================");

    },);

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
      _scheduleNextUpdate();

      print("setAsBackgroundService=======================================================");
    },);
    service.on('setAsBackground_elathakerService').listen((event) {
      // elathakerService();
      service.setAsBackgroundService();

      print("setAsBackground_elathakerService=======================================================");
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

  print("onStart==================================================");
  service.invoke('update');
}
void _scheduleNextUpdate() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final durationUntilMidnight = tomorrow.difference(now);

  print("_scheduleNextUpdate scheduled for tomorrow ===================================");

  Timer(durationUntilMidnight, () async {

    StatusRequest status = await times(false,true);

    if (status == StatusRequest.success) {
      print("times(false) succeeded. Scheduling next update...");
      _scheduleNextUpdate(); // Reschedule only if it succeeded
    } else {
      print("times(false) failed with status: $status. Will NOT schedule next update.");
      // Optional: Retry later or log for debugging
    }
  });
}
