import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/elathaker_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../component/athkar/customAthkarCard.dart';
import '../../../component/chooseFontSize.dart';

class AthkarSM extends StatelessWidget {
  const AthkarSM({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'الأذكار اليومية',
            style: TextStyle( fontWeight: FontWeight.bold),
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
        body: Column(
          children: [
            ChooseFontSize(
              onPressedIncrease:() => controller.changeTextScaler(0.1),
              onPressedDecrease: () => controller.changeTextScaler(-0.1),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30,right: 20,top:10),
              child: ListView.builder(
                itemCount: controller.adhkar.length,
                itemBuilder: (context, index) => GetBuilder<ElathakerController>(
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
                      textScaler: controller.textScaler,
                    );
                  },
                ),
              ),
            ),
          ],
        )
    );
  }
}
