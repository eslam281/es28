import 'package:es28/routes.dart';
import 'package:es28/veiw/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'core/class/theme.dart';
import 'core/functions/background_service.dart';
import 'core/functions/initBox.dart';

Box? myBox;
// const taskName = "elathakerDailyTask";

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//
//     if (task == taskName) {
//       final Map<String, String> times = Map<String, String>.from(myBox?.get("time") ?? {});
//       final now = DateTime.now();
//       final currentTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
//
//       if (times["Fajr"] == currentTime || times["Asr"] == currentTime) {
//         elathakerService();
//         print("✅ elathakerService triggered at $currentTime");
//       } else {
//         print("⏰ Not time yet: $currentTime");
//       }
//     }
//
//     return Future.value(true);
//   });
// }
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await initalBox("times");

  if(! await FlutterBackgroundService().isRunning()){
  await initializeService();
  await FlutterBackgroundService().startService();
  }
  FlutterBackgroundService().invoke("setAsBackground");
  // await Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: false, // Set to true to debug in logcat
  // );
  //
  // await Workmanager().registerPeriodicTask(
  //   "1",
  //   taskName,
  //   frequency: const Duration(minutes: 15), // minimum allowed
  //   constraints: Constraints(
  //     networkType: NetworkType.not_required,
  //     requiresBatteryNotLow: true,
  //   ),
  // );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(
      title: 'Hisn Muslim',

      // textDirection: TextDirection.rtl,
      theme:MyTheme.lightTheme,
      // darkTheme:ThemeData.dark() ,

      // home:  const Test(),
      getPages: routes,
      home:const SplashScreen(),
    );
  }
}