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
          const SizedBox(height: 20,),

          Card(
            color: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical:20),
              child: Column(
                children: [
                  AppTextField(
                    textEditingController: controller.textcontroll,
                    title: "",
                    hint: "اختر الذكر",
                    isCitySelected: true,
                    cities: controller.itemsDropdown,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secondColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        controller.setCounter(
                            controller.textcontroll.text, context);
                      },
                      child: const Text(
                        "أضف إلى العداد",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

            const SizedBox(height: 50,),

            Text("${controller.counter}",
              style: const TextStyle(fontSize: 30, color: AppColor.white),
             textDirection:TextDirection.rtl,),
            const SizedBox(height: 10,),

          Text("${controller.i}",
              style: const TextStyle(fontSize: 30, color: AppColor.white)),
            const SizedBox(height: 20,),

            customButton(onPressed: () {controller.Addi();}),
          const SizedBox(height: 40,),
          ],),
      );
    }
    );
  }
}
