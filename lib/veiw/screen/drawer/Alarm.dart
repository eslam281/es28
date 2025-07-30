import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/alarm_controller.dart';
import '../../../core/constant/color.dart';


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