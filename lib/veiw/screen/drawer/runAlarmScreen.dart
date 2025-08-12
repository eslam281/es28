import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/services/alarm_service.dart';

class AlarmRingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.alarm, size: 100, color: AppColor.primaryColor),
            const SizedBox(height: 20),
            const Text('🕌   حان الآن وقت الفجر', style:
            TextStyle(color: AppColor.primaryColor, fontSize: 24)),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondColor,foregroundColor:AppColor.white),
              onPressed: () {
                AudioPlayer(playerId: "Fajr").stop();
              },
              child: const Text("إيقاف"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondColor,foregroundColor:AppColor.white),
              onPressed: () {
                AndroidAlarmManager.oneShot(const Duration(minutes: 5),
                    2,alarm,
                    rescheduleOnReboot: true,allowWhileIdle: true
                    ,alarmClock: true, exact: true,wakeup: true
                );
              },
              child: const Text("تأجيل 5 دقائق"),
            ),
          ],
        ),
      ),
    );
  }
}
