import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



import '../functions/getOfFajr.dart';

@pragma("vm:entry-point")
void alarm()async{
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = const InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (payload) {
      // عند الضغط على الإشعار، افتح شاشة منبه
    },
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    '⏰ وقت الفجر',
    'حان الآن موعد أذان الفجر',
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'alarm_channel',
        'Alarms',
        importance: Importance.max,
        priority: Priority.high,
        fullScreenIntent: true, // 💥 لجعل الإشعار يفتح الشاشة
        playSound: true,
      ),
    ),
  );
  final player = AudioPlayer();
  await player.play(AssetSource("audio/Abdul_Basit_Abdul_Samad.mp3"));

  DateTime nextFajr =await getDataOfFajr();
  await AndroidAlarmManager.oneShotAt(nextFajr, 1,
    alarm, wakeup: true, exact: true,alarmClock: true,
    allowWhileIdle: true, rescheduleOnReboot: true,
  );
  print(" AndroidAlarmManager.oneShotAt 00000000000000000000000000000000");
}