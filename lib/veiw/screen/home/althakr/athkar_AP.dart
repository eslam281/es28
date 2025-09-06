import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/athakerAP_controller.dart';
import '../../../../core/constant/color.dart';

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
            'الأذكار اليومية',
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
        body: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 30,right: 20,top:10),
          child: ListView.builder(
            itemCount: controller.adhkar.length,
            itemBuilder: (context, index) => GetBuilder<athakerAPController>(
              builder: (controller) {
                bool completed =
                    controller.count[index] >= controller.adhkar[index][1];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  color: completed
                      ? Colors.green.withValues(alpha: 0.15)
                      : Colors.white.withValues(alpha: 0.05),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                           textDirection:TextDirection.rtl ,
                          controller.adhkar[index][0],
                          style: const TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.count[index]} / ${controller.adhkar[index][1]}',
                              style: TextStyle(
                                color: completed ? Colors.green : null,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 800),
                              child:completed
                                  ? const Icon(Icons.check_circle,
                                  color: Colors.green)
                                  : ElevatedButton(
                                onPressed: () => controller.onTap(
                                  controller.adhkar[index][1],
                                  index,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.secondColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('تسبيح'),
                              ),
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
