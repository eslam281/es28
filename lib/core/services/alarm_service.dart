import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../functions/getOfFajr.dart';

@pragma("vm:entry-point")
void alarm()async{

  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //
  // const AndroidInitializationSettings initializationSettingsAndroid =
  // AndroidInitializationSettings('@mipmap/ic_launcher');
  //
  // final InitializationSettings initializationSettings = const InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );
  //
  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  //   onDidReceiveNotificationResponse: (response) async {
  //     if (response.actionId == 'stop_alarm') {
  //       // flutterLocalNotificationsPlugin.cancel(0);
  //       // await player.stop();
  //     }
  //   },
  //   // onDidReceiveBackgroundNotificationResponse: (response) async {
  //   // if (response.actionId == 'stop_alarm') {
  //   //   // await player.stop();
  //   // }
  //   // },
  // );
  final player = await AudioPlayer(playerId: "Fajr");
  await player.play(AssetSource('audio/abdul_basit_abdul_samad.mp3'));


  // await flutterLocalNotificationsPlugin.show(
  //   0,
  //   '⏰ وقت الفجر',
  //   ' اضغط لإيقاف التنبيه',
  //   const NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'alarm_channel',
  //       'Alarms',
  //       channelDescription: 'تنبيهات الأذان',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //       fullScreenIntent: true, // ✅ هذا هو المهم لتشغيل الشاشة
  //       ticker: 'ticker',
  //       enableLights: true,
  //       autoCancel: false,
  //       // actions: <AndroidNotificationAction>[
  //       //   AndroidNotificationAction(
  //       //     'stop_alarm',
  //       //     'إيقاف الأذان',
  //       //     showsUserInterface: false,
  //       //     cancelNotification: true,
  //       //   ),
  //       // ],
  //     ),
  //   ),
  // );



  DateTime nextFajr =await getDataOfFajr();
  await AndroidAlarmManager.oneShotAt(nextFajr, 1,
    alarm, wakeup: true, exact: true,alarmClock: true,
    allowWhileIdle: true, rescheduleOnReboot: true,
  );
  print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
}