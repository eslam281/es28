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
        title: const Text('المنبه',style:TextStyle(color:AppColor.white,fontSize: 30)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GetBuilder<AlarmControllerImp>(
              builder: (controller) {
                return Switch.adaptive(value: controller.ison ,
                  activeColor: AppColor.secondColor,
                  onChanged: controller.onChange,);
              }
            ),
          ),
          const SizedBox(height: 20,),
          const Text("add sound from the device",style:TextStyle(color:AppColor.white)),
          const SizedBox(height: 5,),
          IconButton(onPressed: () {}
              , icon: const Icon(Icons.add_circle_outline))
        ],
      ),
    );
  }
}