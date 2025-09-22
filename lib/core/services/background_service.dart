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
      playAzanWithNotification();
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


@pragma('vm:entry-point')
void playAzanWithNotification()async{
  FlutterBackgroundService flutterBackgroundService = FlutterBackgroundService();
  final player = await AudioPlayer(playerId: "Fajr");
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = const InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) async {
      if (response.payload == 'stop_alarm') {
        flutterBackgroundService.invoke('stopService');
      }
    },
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );

  await player.play(AssetSource('audio/Abdul_Basit_Abdul_Samad.mp3'));


  await flutterLocalNotificationsPlugin.show(
    0,
    '⏰ وقت الفجر',
    ' اضغط لإيقاف التنبيه',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'alarm_channel',
        'Alarms',
        channelDescription: 'تنبيهات الأذان',
        importance: Importance.max,
        priority: Priority.high,
        fullScreenIntent: true, // ✅ هذا هو المهم لتشغيل الشاشة
        ticker: 'ticker',
        enableLights: true,
        playSound: false,autoCancel: true,
        actions: <AndroidNotificationAction>[
          AndroidNotificationAction(
            'stop_alarm',
            'إيقاف الأذان',
            cancelNotification: true,
          ),
        ],
      ),
    ),
  );

}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response)async {
    FlutterBackgroundService flutterBackgroundService = FlutterBackgroundService();
    flutterBackgroundService.invoke('stopService');

}