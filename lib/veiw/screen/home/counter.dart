import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/count_controller.dart';
import '../../../core/constant/color.dart';
import '../../component/custom.dart';
import '../../component/dropdownlist.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerImp());
    return GetBuilder<CountControllerImp>(builder: (controller) {
      return  SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const SizedBox(height: 40,),

            Column(children: [
              AppTextField(textEditingController:controller.textcontroll,
                title: "",
                hint: "أدخل الذكر",
                isCitySelected: true,
                cities:controller.itemsDropdown,),

              const SizedBox(height: 5,),
              MaterialButton(onPressed: () {
                controller.setCounter(controller.textcontroll.text,context);
              },
                  color: AppColor.secondColor,
                  child: const Text("ادخل الذكر", style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:AppColor.white),)),
            ],),

            const SizedBox(height: 50,),

            Column(
              children: [
                Text("${controller.counter} ${controller.i}",
                  style: const TextStyle(fontSize: 30, color: AppColor.white),
                  softWrap: true,textDirection:TextDirection.rtl,),
                const SizedBox(height: 20,),

                customButton(onPressed: () {controller.Addi();}),
              ],
            ),
          const SizedBox(height: 40,),
          ],),
      );
    }
    );
  }
}
