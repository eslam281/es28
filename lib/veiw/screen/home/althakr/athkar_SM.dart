import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/elathaker_controller.dart';
import '../../../../core/constant/color.dart';

class AthkarSM extends StatelessWidget {
  const AthkarSM({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return Scaffold(
        backgroundColor: AppColor.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'الأذكار اليومية',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView.builder(
            itemCount: controller.adhkar.length,
            itemBuilder: (context, index) => GetBuilder<ElathakerController>(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.adhkar[index][0],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${controller.count[index]} / ${controller.adhkar[index][1]}',
                              style: TextStyle(
                                color: completed ? Colors.green : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
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
