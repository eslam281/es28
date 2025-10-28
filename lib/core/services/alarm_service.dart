// import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
//
// import '../functions/getOfFajr.dart';
//
// @pragma('vm:entry-point')
// void alarm()async{
//    FlutterBackgroundService flutterBackgroundService = await FlutterBackgroundService();
//    flutterBackgroundService.invoke('playAzan');
//
//    DateTime nextFajr =await getDataOfFajr();
//
//   await AndroidAlarmManager.oneShotAt(nextFajr, 1,
//     alarm, wakeup: true, exact: true,
//       alarmClock: true,allowWhileIdle: true
//   );
//   print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
// }
//
// // @pragma('vm:entry-point')
// // Future<void> playAzanWithNotification()async{
// //   FlutterBackgroundService flutterBackgroundService = FlutterBackgroundService();
// //   final player = AudioPlayer(playerId: "Fajr");
// //   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// //
// //   const AndroidInitializationSettings initializationSettingsAndroid =
// //   AndroidInitializationSettings('@mipmap/ic_launcher');
// //
// //   final InitializationSettings initializationSettings = const InitializationSettings(
// //     android: initializationSettingsAndroid,
// //   );
// //
// //   await flutterLocalNotificationsPlugin.initialize(
// //     initializationSettings,
// //     onDidReceiveNotificationResponse: (response) async {
// //         player.dispose();
// //         flutterBackgroundService.invoke('stopService');
// //
// //     },
// //     onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
// //   );
// //
// //   await player.play(AssetSource('audio/Abdul_Basit_Abdul_Samad.mp3'));
// //
// //
// //   await flutterLocalNotificationsPlugin.show(
// //     0,
// //     '⏰ وقت الفجر',
// //     ' اضغط لإيقاف التنبيه',
// //     const NotificationDetails(
// //       android: AndroidNotificationDetails(
// //         'alarm_channel',
// //         'Alarms',
// //         channelDescription: 'تنبيهات الأذان',
// //         importance: Importance.max,
// //         priority: Priority.high,
// //         fullScreenIntent: true, // ✅ هذا هو المهم لتشغيل الشاشة
// //         ticker: 'ticker',
// //         enableLights: true,
// //         playSound: false,autoCancel: true,
// //         actions: <AndroidNotificationAction>[
// //           AndroidNotificationAction(
// //             'stop_alarm',
// //             'إيقاف الأذان',
// //             cancelNotification: true,
// //           ),
// //         ],
// //       ),
// //     ),
// //   );
// //
// // }
// //
