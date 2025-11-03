import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/times_controller.dart';
import '../../../core/functions/converTime24_12.dart';
import '../../../core/localization/locationTranslations.dart';
import '../../../core/shared/shimmerReload.dart';
import '../../component/home/timeTile.dart';
import '../../component/home/times_card.dart';

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
              TimesCard(
                textDate: controller.dateResponse ?? "",
                textLocation: getLocalizedLocation(controller.locationList[1]),
                isReady: controller.isready,
                reTimes: controller.reTimes,
              ),

              const SizedBox(height: 30),

              /// Prayer Times
              (controller.data != null)?
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
                ):
              const ShimmerReload()
              ,
              const SizedBox(height: 30),
            ],
          ),
        ),
      );
    });
  }
}