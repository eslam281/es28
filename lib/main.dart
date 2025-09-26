
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:es28/routes.dart';
import 'package:es28/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'controller/drawer/sittings_controller.dart';
import 'core/class/theme.dart';
import 'core/functions/initBox.dart';
import 'core/services/background_service.dart';

Box? myBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  await initializeService();
  myBox = await initalBox("times");

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // await setupDailyTask();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SittingsControllerImp>(
      init: SittingsControllerImp(),
      builder: (context) {
        final textScaler = TextScaler.linear(myBox?.get("textScaler") ?? 1.0);
        return GetMaterialApp(
          title: 'Hisn Muslim',
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: ThemeMode.values[myBox?.get("theme")??0],
          // home:  const Test(),
          getPages: routes,
          // home: const Test(),
          home: const SplashScreen(),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: textScaler),
              child: child!,
            );
          },
        );
      }
    );
  }
}
