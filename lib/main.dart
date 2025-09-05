import 'dart:isolate';
import 'dart:ui';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'controller/drawer/alarm_controller.dart';
import 'core/class/theme.dart';
import 'core/functions/initBox.dart';
import 'core/services/alarm_service.dart';
import 'core/services/daily_task_service.dart';

Box? myBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();

  myBox = await initalBox("times");

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupDailyTask();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Hisn Muslim',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: ThemeMode.light,
      // home:  const Test(),
      getPages: routes,
      home: const SplashScreen(),
    );
  }
}
