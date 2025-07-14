import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import '../../controller/times_controller.dart';

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

  Timer.periodic(const Duration(hours: 24), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        service.setForegroundNotificationInfo(title: "Hisn Muslim", content: "content");
      }
    }
    TimesController controller=TimesController();
    controller.times();
    service.invoke('update');
  },);
}