import 'dart:async';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'alarm_service.dart';

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
        // foreground tap
        if (response.payload == 'stop_alarm') {
          service.invoke('stopAzan');
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
    /////////
    service.on('playAzan').listen((event) async {
      print("Service: playAzan received");

      // 1) اجعل الخدمة foreground مع notification مستمر
      await service.setForegroundNotificationInfo(
        title: "Hisn Muslim",
        content: "تنبيه الفجر يعمل الآن",
      );
      service.setAsForegroundService();

      // 2) شغّل الصوت
      await player.play(AssetSource('audio/Abdul_Basit_Abdul_Samad.mp3'));

      // 3) اعرض نوتيفيكيشن قابل للإزالة (مع action لإيقاف الأذان)
      const androidDetails = AndroidNotificationDetails(
        'alarm_channel',
        'Alarms',
        channelDescription: 'تنبيهات الأذان',
        importance: Importance.max,
        priority: Priority.high,
        fullScreenIntent: true,
        autoCancel: false,
        playSound: false,
        // يمكنك وضع ongoing: true إذا رغبت في منع الإزالة (لكن system قد يتجاهل على أنواع معينة)
        // ongoing: true,
      );

      await flutterLocalNotificationsPlugin.show(
        0,
        '⏰ وقت الفجر',
        'اضغط لإيقاف التنبيه',
        const NotificationDetails(android: androidDetails),
        payload: 'stop_alarm',
      );
    });

    service.on('stopAzan').listen((event) async {
      print("Service: stopAzan received");

      try {
        await player.stop();
        await player.dispose();
      } catch (e) {
        print("Error stopping player: $e");
      }

      // الغي النوتيفيكيشن المحلية
      final fln = FlutterLocalNotificationsPlugin();
      await fln.cancel(0);

      // ارجع الخدمة للخلفية أو قفلها:
      service.setAsBackgroundService();
      // أو لو عايز توقف الخدمة نهائيًا:
      service.stopSelf();
    });

    service.on('setAsForeground').listen((event)async {
      await service.setForegroundNotificationInfo(
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
  service.invoke('update');
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response)async {
  FlutterBackgroundService flutterBackgroundService = FlutterBackgroundService();
  flutterBackgroundService.invoke('stopAzan');
}