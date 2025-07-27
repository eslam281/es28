
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import '../../main.dart';
import '../services/time_service.dart';

const String dailyTask = "dailyPrayerTimeTask";

Future<void> setupDailyTask() async {

  if (!Hive.isBoxOpen("times")) {
    Hive.init("/data/user/0/com.example.es28/app_flutter"); // ✅ المسار الثابت
    myBox =await Hive.openBox("times");
  }

  bool shouldDelayUntilMidnight = await checkDate();
  Duration delay = shouldDelayUntilMidnight
      ? _calculateInitialDelayUntilMidnight()
      : const Duration(seconds: 10);

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // للتجربة السريعة
  );

  await Workmanager().registerPeriodicTask(
    "1", // unique ID
    dailyTask,
    frequency: const Duration(hours: 1),
    initialDelay:delay,
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (!Hive.isBoxOpen("times")) {
      Hive.init("/data/user/0/com.example.es28/app_flutter"); // ✅ المسار الثابت
      myBox =await Hive.openBox("times");
    }
    // if (task == dailyTask) {

      await times(false, true);
    // }
    return Future.value(true);
  });
}
/// حساب الفرق حتى منتصف الليل
Duration _calculateInitialDelayUntilMidnight() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  return tomorrow.difference(now);
}
Future<bool> checkDate()async{
  String dateResponse =await myBox?.get("date")??"";
  return dateResponse==DateFormat('dd-MM-yyyy').format(DateTime.now());
}