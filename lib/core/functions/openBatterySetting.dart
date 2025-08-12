import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:permission_handler/permission_handler.dart';

void openBatteryOptimizationSettings() async{
  // final status = await Permission.ignoreBatteryOptimizations.status;
  // print(status);
  // if (!status.isGranted) {
    await Permission.ignoreBatteryOptimizations.request();
  // }
}
void openManageOverlay()async {
  final intent = const AndroidIntent(
    action: 'android.settings.action.MANAGE_OVERLAY_PERMISSION',
    data: 'package:com.example.es28', // استبدل باسم الحزمة الحقيقي لتطبيقك
    flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
  );
  await intent.launch();
}

void requestExactAlarmPermission() async {
  final intent = const AndroidIntent(
    action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
    data: 'package:com.example.es28', // استبدل باسم الباكيج الفعلي
  );
  await intent.launch();
}