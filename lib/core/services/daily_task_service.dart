// import 'package:workmanager/workmanager.dart';
// import '../services/time_service.dart';
//
// const String dailyTask = "dailyPrayerTimeTask";
//
// /// الدالة التي ينفذها WorkManager
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     if (task == dailyTask) {
//       await times(false, true);
//     }
//     return Future.value(true);
//   });
// }
//
// /// تسجيل مهمة يومية تبدأ عند منتصف الليل
// Future<void> setupDailyTask() async {
//   await Workmanager().initialize(
//     callbackDispatcher,
//     isInDebugMode: false,
//   );
//
//   await Workmanager().registerPeriodicTask(
//     "1", // unique ID
//     dailyTask,
//     frequency: const Duration(hours: 24),
//     initialDelay: _calculateInitialDelayUntilMidnight(),
//     constraints: Constraints(
//       networkType: NetworkType.connected,
//     ),
//   );
// }
//
// /// حساب الفرق حتى منتصف الليل
// Duration _calculateInitialDelayUntilMidnight() {
//   final now = DateTime.now();
//   final tomorrow = DateTime(now.year, now.month, now.day + 1);
//   return tomorrow.difference(now);
// }
import 'package:hive/hive.dart';
import 'package:workmanager/workmanager.dart';
import '../../main.dart';
import '../functions/initBox.dart';
import '../services/time_service.dart';

const String dailyTask = "dailyPrayerTimeTask";

Future<void> setupDailyTask() async {
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // للتجربة السريعة
  );

  await Workmanager().registerPeriodicTask(
    "1", // unique ID
    dailyTask,
    frequency: const Duration(hours: 1),
    initialDelay: const Duration(seconds:10),
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
}



@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // if (task == dailyTask) {
    if (!Hive.isBoxOpen("times")) {
      Hive.init("/data/user/0/com.example.es28/app_flutter"); // ✅ المسار الثابت
    myBox =await Hive.openBox("times");
    }
      print("✅✅✅ WorkManager task executed ✅✅✅");
      await times(false, true);
    // }
    return Future.value(true);
  });
}
