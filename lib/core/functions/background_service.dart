import 'dart:async';
import 'dart:ui';

import 'package:es28/core/functions/time_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';



Future<void> initializeService()async {
  final service =FlutterBackgroundService();
  await service.configure(
      iosConfiguration: IosConfiguration(
          autoStart:true,onBackground:onIosBackground
      ),
      androidConfiguration: AndroidConfiguration(onStart:onStart,
          isForegroundMode: false,autoStart:true)
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
    },);

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    },);

    service.on('stopService').listen((event) {
      service.stopSelf();
    },);
  }

  Timer.periodic(const Duration(seconds: 5), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        service.setForegroundNotificationInfo(
          title: "Hisn Muslim",
          content: "Running in background",
        );
      }
    }
  });

  _scheduleNextUpdate();
  service.invoke('update');
}
void _scheduleNextUpdate() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  final durationUntilMidnight = tomorrow.difference(now);

  Timer(durationUntilMidnight, () async {
    await times(false); // Fetch again tomorrow
    _scheduleNextUpdate(); // Reschedule again
  });
}