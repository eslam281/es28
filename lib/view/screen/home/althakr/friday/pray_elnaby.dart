import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../controller/althakr/prayElnaby_controller.dart';
import '../../../../../core/constant/color.dart';
import '../../../../component/custom.dart';
import '../../../../component/dropdownlist.dart';

class PrayElnaby extends StatelessWidget {
  const PrayElnaby({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<PrayElnabyControllerImp>(
        init: PrayElnabyControllerImp(),
        builder: (controller) {
      return  Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.seti();
              controller.setCounter("ادخل الذكر ",context);
            },
            child: const Icon(Icons.settings_backup_restore_outlined,
              size: 30,color:AppColor.white,),
            backgroundColor: AppColor.secondColor) ,
        body: SingleChildScrollView(
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

            Text("${controller.counterName}",
              style: const TextStyle(fontSize: 30,
                // color: AppColor.white
              ),
              textDirection:TextDirection.rtl,),
            const SizedBox(height: 10,),

            Text("${controller.i}",
              style: const TextStyle(fontSize: 30,),
            ),
            const SizedBox(height: 35,),

            CustomButton(onPressed:controller.Addi),
            const SizedBox(height: 20,),
          ],),
        ),
      );
    }
    );
  }
}
