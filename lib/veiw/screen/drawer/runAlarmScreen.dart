import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

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
                // إيقاف الصوت
              },
              child: const Text("إيقاف"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.secondColor,foregroundColor:AppColor.white),
              onPressed: () {
                // تأجيل لـ 10 دقائق (Snooze)
              },
              child: const Text("تأجيل 10 دقائق"),
            ),
          ],
        ),
      ),
    );
  }
}
