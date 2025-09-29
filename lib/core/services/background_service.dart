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
  WidgetsFlutterBinding.ensureInitialized();

  if(service is AndroidServiceInstance){
    ////////////
    final player = AudioPlayer(playerId: "Fajr");
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = const InitializationSettings(
      android: initializationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (response) async {
          service.invoke('stopAzan');
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    /////////
    service.on('playAzan').listen((event) async {
      print("Service: playAzan received");
      service.setAsForegroundService();

      await player.play(AssetSource('audio/Abdul_Basit_Abdul_Samad.mp3')).then((value) {
          service.invoke('stopAzan');
        },);

      const androidDetails = AndroidNotificationDetails(
        'alarm_channel',
        'Alarms',
        channelDescription: 'تنبيهات الأذان',
        importance: Importance.max,
        priority: Priority.high,
        autoCancel: false,
        playSound: false,
        enableLights:true ,
        enableVibration: true,
        visibility:NotificationVisibility.public ,
        ongoing: true,
        fullScreenIntent: true,
        actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'stop_alarm_action', // id بتاع الـ action
          'إيقاف الأذان',
          cancelNotification: true,
        ),
      ],
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        '⏰ وقت الفجر',
        null,
        const NotificationDetails(android: androidDetails),
        payload: 'stop_alarm',
      );
    });

    service.on('stopAzan').listen((event) async {
      print("Service: stopAzan received at ${DateTime.now()} -- event: $event");

      try {
        await player.stop();
        await player.dispose();
      } catch (e) {
        print("Error stopping player: $e");
      }

      // الغي النوتيفيكيشن المحلية
     await FlutterLocalNotificationsPlugin().cancel(0);

      // ارجع الخدمة للخلفية أو قفلها:
      service.setAsBackgroundService();
      // أو لو عايز توقف الخدمة نهائيًا:
      await service.stopSelf();
    });


    service.on('stopService').listen((event) {
      service.stopSelf();
    },);
  }
  service.invoke('update');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  try {
    final service = FlutterBackgroundService();
    service.invoke('stopAzan');
  } catch (e, st) {
    print('*** notificationTapBackground invoke error: $e\n$st');
  }
}