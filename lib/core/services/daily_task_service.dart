
import 'package:intl/intl.dart';
import 'package:workmanager/workmanager.dart';
import '../../main.dart';
import '../class/statusrequest.dart';
import '../functions/initBox.dart';
import '../services/time_service.dart';

const String dailyTask = "dailyPrayerTimeTask";

Future<void> setupDailyTask() async {

  myBox = await initalBox("times");

  bool shouldDelayUntilMidnight = await checkDate();
  Duration delay = shouldDelayUntilMidnight
      ? _calculateInitialDelayUntilMidnight()
      : const Duration(seconds: 10);

  await Workmanager().initialize(callbackDispatcher);

  await Workmanager().registerPeriodicTask(
    "1", // unique ID
    dailyTask,
    frequency: const Duration(minutes: 15),
    initialDelay:delay,
    constraints: Constraints(
      networkType: NetworkType.connected,
    ),
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  StatusRequest statusRequest = StatusRequest.onitnial;
  Workmanager().executeTask((task, inputData) async {
    myBox = await initalBox("times");
    // if (task == dailyTask) {
    statusRequest=  await times(false, true);
    // }
    if(statusRequest == StatusRequest.success)
      return Future.value(true);

    return Future.value(false);
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