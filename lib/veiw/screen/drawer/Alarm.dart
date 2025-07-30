import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/alarm_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/getOfFajr.dart';


class Alarm extends StatelessWidget {
  const Alarm({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(AlarmControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: const Text('Alarm',style:TextStyle(color:AppColor.white)),
      ),
      body: Center(
        child: GetBuilder<AlarmControllerImp>(
          builder: (controller) {
            return Switch.adaptive(value: controller.ison ,
              onChanged: controller.onChange,);
          }
        ),
      ),
    );
  }
}