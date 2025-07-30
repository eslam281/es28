import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'core/class/theme.dart';
import 'core/functions/initBox.dart';

Box? myBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await initalBox("times");
  // await setupDailyTask(); // ✅ تشغيل الخلفية اليومية
  await AndroidAlarmManager.initialize();

   SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,]);

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: 'Hisn Muslim',
      theme:MyTheme.lightTheme,
      // home:  const Test(),
      getPages: routes,
      home:const SplashScreen(),
    );
  }
}