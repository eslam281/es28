import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

class Alarm extends StatelessWidget {
  const Alarm({super.key});

  @override
  Widget build(BuildContext context) {
    bool ison = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Center(
        child: Switch(value:ison , onChanged: (value) {
          ison=value;
          if(ison==true){
          AndroidAlarmManager.periodic(const Duration(seconds: 10), 1,
                (){debugPrint("00000000000000000");},);
            
          }else{
            AndroidAlarmManager.cancel(1);
          }

        },),
      ),
    );
  }
}
