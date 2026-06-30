import 'package:es28/core/class/handlingdataview.dart';
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
        widget: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: context.isDarkMode
                  ? [Colors.black, Colors.grey.shade900]
                  : [Colors.white, Colors.grey.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                (controller.data != null)
                    ? Column(
                        children: [
                          timeTile("الفجر", controller.data!.fajr, context),
                          timeTile("شروق الشمس", controller.data!.sunrise, context),
                          timeTile("الظهر", convertF(controller.data!.dhuhr!), context),
                          timeTile("العصر", convertF(controller.data!.asr!), context),
                          timeTile("المغرب", convertF(controller.data!.maghrib!), context),
                          timeTile("العشاء", convertF(controller.data!.isha!), context),
                          
                          // Modern Bottom Card for Night Third
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.indigo.shade800,
                                  Colors.deepPurple.shade900,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.indigo.withAlpha(100),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "الثلث الأخير",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "من الليل",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(40),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Text(
                                    controller.data!.lastthird!.substring(0, 5),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'monospace',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const ShimmerReload(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
    });
  }
}
