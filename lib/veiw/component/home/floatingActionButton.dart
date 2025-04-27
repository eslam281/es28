import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/count_controller.dart';

class CustomFloatingActionButton extends GetView<CountControllerImp> {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
        return FloatingActionButton(
            onPressed: () {
              controller.seti();
              controller.setCounter("ادخل الذكر ",context);
            },
            child: const Icon(Icons.settings_backup_restore_outlined,
              size: 30,color:AppColor.white,),
            backgroundColor: AppColor.secondColor) ;
  }
}
