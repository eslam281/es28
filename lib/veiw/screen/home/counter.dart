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

          Card(
            color:context.isDarkMode? Colors.grey.shade900:Colors.white30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 10,shadowColor: Colors.grey.withAlpha(55),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical:10),
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
                      child:  Text(
                        "أضف إلى العداد",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:context.isDarkMode?AppColor.white: AppColor.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

            const SizedBox(height: 30,),

            Text("${controller.counter}",
              style: const TextStyle(fontSize: 30,
                  // color: AppColor.white
              ),
             textDirection:TextDirection.rtl,),
            const SizedBox(height: 10,),

          Text("${controller.i}",
              style: const TextStyle(fontSize: 30,
                  // color: AppColor.white
              )),
            const SizedBox(height: 35,),

            CustomButton(onPressed:controller.Addi),
          const SizedBox(height: 20,),
          ],),
      );
    }
    );
  }
}
