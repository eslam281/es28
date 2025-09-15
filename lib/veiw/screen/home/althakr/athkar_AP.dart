import 'package:es28/controller/sittings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/athakerAP_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../component/athkar/customAthkarCard.dart';
import '../../../component/chooseFontSize.dart';

class AthkarAP extends StatelessWidget {
  const AthkarAP({super.key});

  @override
  Widget build(BuildContext context) {
    athakerAPController controller = Get.put(athakerAPController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'أذكار بعد الصلاة',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: AppColor.secondColor),
              onPressed: () => controller.customRefresh(),
              padding: const EdgeInsets.only(right: 20),
              tooltip: 'تحديث الأذكار',
            )
          ],
        ),
        body:  GetBuilder<SittingsControllerImp>(
          builder: (sittingsControllerImp) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChooseFontSize(
                          onPressedIncrease:() => sittingsControllerImp.changeTextScalerAthkar(0.1),
                          onPressedDecrease: () => sittingsControllerImp.changeTextScalerAthkar(-0.1),
                        )
                  ),
                  ListView.builder(
                    padding: const EdgeInsets.only(left: 20, bottom: 30,right: 20,top:10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.adhkar.length,
                    itemBuilder: (context, index) => GetBuilder<athakerAPController>(
                      builder: (controller) {
                        bool completed =
                            controller.count[index] >= controller.adhkar[index][1];
                        return CustomAthkarCard(
                          elthakr: controller.adhkar[index][0],
                          count: controller.count[index],
                          completed: completed,
                          max: controller.adhkar[index][1],
                          onTap: () {
                            controller.onTap(index);
                          },
                          textScaler: sittingsControllerImp.textScalerAthkar,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        )
    );
  }
}
