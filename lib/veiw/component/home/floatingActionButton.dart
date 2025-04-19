import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/count_controller.dart';
import '../../../controller/home_controller.dart';

class CustomFloatingActionButton extends GetView<HomeControllerImp> {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    CountControllerImp controllerCount = Get.find();

        return SizedBox(
      width: 70,
      child: FloatingActionButton(
          onPressed: () {
            controllerCount.seti();
            controllerCount.setCounter("ادخل الذكر ",context);
          },
          child: const Column(
            children: [
              SizedBox(height: 3),

              Icon(Icons.settings_backup_restore_outlined,
                size: 30,),

              const Text(
                "إعادة ضبط",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          backgroundColor: Colors.blue),
    ) ;
  }
}
