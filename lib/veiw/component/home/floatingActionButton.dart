import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/count_controller.dart';
import '../../../controller/home_controller.dart';

class CustomFloatingActionButton extends GetView<HomeControllerImp> {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    CountControllerImp controllerCount = Get.find();

        return FloatingActionButton(
            onPressed: () {
              controllerCount.seti();
              controllerCount.setCounter("ادخل الذكر ",context);
            },
            child: const Icon(Icons.settings_backup_restore_outlined,
              size: 30,color:AppColor.white,),
            backgroundColor: AppColor.secondColor) ;
  }
}
