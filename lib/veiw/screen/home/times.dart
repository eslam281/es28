import 'package:es28/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/custom.dart';
import '../../../controller/times_controller.dart';

class Times extends StatelessWidget {
  const Times({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(TimesController());
    return GetBuilder<TimesController>(builder: (controller) {
      print(controller.statusRequest);
      return Container(
        color: Colors.black,height: double.infinity,
        padding:const EdgeInsets.all(20) , alignment: Alignment.center,
        child:  SingleChildScrollView(
          child: HandlingDataView(
          statusRequest:controller.statusRequest,
          widget: Column(crossAxisAlignment:CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30,),

              if (controller.data != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customCard(text: " فجر   ${controller.data!.fajr}"),
                  customCard(text: " شروق الشمس   ${controller.data!.sunrise}"),
                  customCard(text: "  ظهر   ${controller.data!.dhuhr}"),
                  customCard(text: " عصر   ${controller.convertF(controller.data!.asr!)}"),
                  customCard(text: " مغرب   ${controller.convertF(controller.data!.maghrib!)}"),
                  customCard(text: " عشاء   ${controller.convertF(controller.data!.isha!)}"),
                  customCard(text: " الثلث الاخير من الليل   ${controller.data!.lastthird}"),
                ],
              ),
              const SizedBox(height: 30,)
            ],)
        ),
        ),
      );
    }



    );
  }
}
