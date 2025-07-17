import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/times_controller.dart';
import '../../../core/functions/converTime24_12.dart';
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.dateResponse ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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

              const SizedBox(height: 30),

              /// Prayer Times
              if (controller.data != null)
                Column(
                  children: [
                    timeTile("الفجر", controller.data!.fajr),
                    timeTile("شروق الشمس", controller.data!.sunrise),
                    timeTile("الظهر", convertF(controller.data!.dhuhr!)),
                    timeTile("العصر", convertF(controller.data!.asr!)),
                    timeTile("المغرب", convertF(controller.data!.maghrib!)),
                    timeTile("العشاء", convertF(controller.data!.isha!)),
                    timeTile("الثلث الأخير من الليل", controller.data!.lastthird),
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