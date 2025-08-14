import 'dart:isolate';
import 'dart:ui';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../functions/getOfFajr.dart';
final player = AudioPlayer(playerId: "Fajr");
final FlutterLocalNotificationsPlugin notifications = FlutterLocalNotificationsPlugin();

@pragma("vm:entry-point")
void alarm()async{
  final SendPort? sendPort = IsolateNameServer.lookupPortByName("alarm_port");
  sendPort?.send("play_alarm");

  DateTime nextFajr =await getDataOfFajr();
  await AndroidAlarmManager.oneShotAt(nextFajr, 1,
    alarm, wakeup: true, exact: true,alarmClock: true,
    allowWhileIdle: true, rescheduleOnReboot: true,
  );
  print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
}

Future<void> showStopNotification() async {
  const androidDetails = AndroidNotificationDetails(
    'alarm_channel',
    'Alarms',
    channelDescription: 'تنبيهات الأذان',
    importance: Importance.max,
    priority: Priority.high,
    fullScreenIntent: true,
    playSound: false,
    actions: [
      AndroidNotificationAction(
        'stop_alarm',
        'إيقاف الأذان',
        showsUserInterface: true,
      ),
    ],
  );

  const details = NotificationDetails(android: androidDetails);

  await notifications.show(
    0,
    '⏰ وقت الفجر',
    'اضغط لإيقاف التنبيه',
    details,
    payload: "stop_alarm",
  );
}

alarmMain()async{
// تسجيل المنفذ في IsolateNameServer
  final port = ReceivePort();
  IsolateNameServer.registerPortWithName(port.sendPort, "alarm_port");

  // الاستماع للرسائل القادمة من isolates الأخرى
  port.listen((message) async {
    if (message == "play_alarm") {
      await showStopNotification();
      await player.play(AssetSource('audio/Abdul_Basit_Abdul_Samad.mp3')).
    timeout(const Duration(minutes: 1));
    } else if (message == "stop_alarm") {
      await player.stop();
    }
  });

  // تهيئة الإشعارات
  const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidInit);
  await notifications.initialize(
    initSettings,
    onDidReceiveNotificationResponse: (response) async {
      if (response.payload == "stop_alarm") {
        final SendPort? sendPort = IsolateNameServer.lookupPortByName("alarm_port");
        sendPort?.send("stop_alarm");
      }
    }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground
  );

}@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse response) {
  if (response.payload == "stop_alarm") {
    final sendPort = IsolateNameServer.lookupPortByName("alarm_port");
    sendPort?.send("stop_alarm");
  }
}