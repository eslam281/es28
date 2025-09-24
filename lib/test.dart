import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'core/constant/color.dart';
import 'core/services/background_service.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override


    @override
  void initState() {
   intial();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: ()async{
              const androidDetails = AndroidNotificationDetails(
                'alarm_channel',
                'Alarms',
                channelDescription: 'تنبيهات الأذان',
                importance: Importance.max,
                priority: Priority.high,
                autoCancel: false,
                playSound: false,
                actions: <AndroidNotificationAction>[
                  AndroidNotificationAction(
                    'stop_alarm_action', // id بتاع الـ action
                    'إيقاف الأذان',
                    cancelNotification: true,
                  ),
                ],
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
            }, icon: const Icon(Icons.play_circle))
          ],
        ),
      ),
    );
  }
}
intial()async{
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = const InitializationSettings(
    android: initializationSettingsAndroid,
  );

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) async {
      print('onDidReceiveNotificationResponse: actionId=${response.actionId}, payload=${response.payload}');

      print('will invoke stopAzan from foreground callback');

    },
    onDidReceiveBackgroundNotificationResponse: notificationTap,
  );
}
@pragma('vm:entry-point')
void notificationTap(NotificationResponse response) {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  print('*** notificationTapBackground called. actionId=${response.actionId}, payload=${response.payload}');

}