import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';

void openBatteryOptimizationSettings() {
  final intent = const AndroidIntent(
    action: 'android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS',
    data: 'package:com.example.es28', // استبدل باسم الحزمة الحقيقي لتطبيقك
    flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
  );
  intent.launch();
}