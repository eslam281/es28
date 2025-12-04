import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../controller/drawer/PrayingStats_controller.dart';
import '../../../core/class/prayerTimePoint.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/StringToTime.dart';

class PrayingStats extends StatelessWidget {
  const PrayingStats({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrayingStatsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stats"),
      ),
      body: GetBuilder<PrayingStatsController>(
        builder: (controller) {
          if (controller.timings == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                SfCartesianChart(
                    primaryXAxis: const NumericAxis(
                      title: AxisTitle(text: "يوم"),
                    ),
                    primaryYAxis: const NumericAxis(
                      title: AxisTitle(text: "دقائق من منتصف الليل"),
                    ),
                    legend: const Legend(isVisible: true),
                    series:  <CartesianSeries>[
                      // Fajr
                      LineSeries<PrayerTimePoint, int>(
                        name: 'Fajr',
                        color: AppColor.primaryColor,
                        dataSource: List.generate(controller.timings!.length, (index) {
                          return PrayerTimePoint(
                            index + 1,
                            convertTimeToMinutes(controller.timings![index].fajr!),
                          );
                        }),
                        xValueMapper: (data, _) => data.dayIndex,
                        yValueMapper: (data, _) => data.minutes,
                      ),
                    ])
              ],
            ),
          );
        }
      ),
    );
  }
}