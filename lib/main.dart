
import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'core/class/theme.dart';
import 'core/functions/initBox.dart';
import 'core/services/daily_task_service.dart';

Box? myBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await initalBox("times");
  await setupDailyTask(); // ✅ تشغيل الخلفية اليومية

  // if(! await FlutterBackgroundService().isRunning()){
  // await initializeService();
  // await FlutterBackgroundService().startService();
  // }
  // FlutterBackgroundService().invoke("setAsBackground");

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,]);

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