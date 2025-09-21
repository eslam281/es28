import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/times_controller.dart';
import '../../../core/functions/converTime24_12.dart';
import '../../../core/localization/locationTranslations.dart';
import '../../component/home/timeTile.dart';

class Times extends StatelessWidget {
  const Times({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimesController());

    return GetBuilder<TimesController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Header: Date + Refresh
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.dateResponse ?? "",
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                        textAlign: TextAlign.right,
                      ),

                      Text(
                        getLocalizedLocation(controller.locationList[1]),
                        style: const TextStyle(
                          color: AppColor.primaryColor, fontSize: 18, fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      IconButton(
                        onPressed: controller.reTimes,
                        icon: const Icon(Icons.refresh, size: 26),
                        color: controller.isready ? AppColor.secondColor : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// Prayer Times
              if (controller.data != null)
                Column(
                  children: [
                    timeTile("الفجر", controller.data!.fajr,context),
                    timeTile("شروق الشمس", controller.data!.sunrise,context),
                    timeTile("الظهر", convertF(controller.data!.dhuhr!),context),
                    timeTile("العصر", convertF(controller.data!.asr!),context),
                    timeTile("المغرب", convertF(controller.data!.maghrib!),context),
                    timeTile("العشاء", convertF(controller.data!.isha!),context),
                    Card(
                      color:context.isDarkMode? Colors.grey.shade800 :Colors.grey.shade200,
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Column(
                          children: [
                            const Text(
                              "الثلث الأخير من الليل",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColor.secondColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              controller.data!.lastthird!.substring(0, 5),
                              style: const TextStyle(fontSize: 20),
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}