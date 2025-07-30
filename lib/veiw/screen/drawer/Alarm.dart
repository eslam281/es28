import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
  bool ison = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alarm'),
      ),
      body: Center(
        child: Switch.adaptive(value:ison , onChanged: (value) {
          ison=value;
          if(ison==true){
            print("00000000000000000$ison");
          AndroidAlarmManager.periodic(const Duration(seconds:10), 1,
            alarm,
              rescheduleOnReboot: true,allowWhileIdle: true,
              exact: true,wakeup: true
          );
          }else{
            AndroidAlarmManager.cancel(1);
          }
          setState(() {

          });
        },),
      ),
    );
  }
}
@pragma("vm:entry-point")
void alarm(){
  print(" AndroidAlarmManager.periodic00000000000000000000000000000000");
}