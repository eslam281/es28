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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<PrayingStatsController>(
          builder: (controller) {
            if (controller.timings == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.timeName.length,
              itemBuilder: (context, index) =>
                  SfCartesianChart(
                      primaryXAxis: const NumericAxis(
                        title: AxisTitle(text: "يوم"),
                      ),
                      legend: const Legend(isVisible: true),
                      series:  <CartesianSeries>[
                        LineSeries<PrayerTimePoint, int>(
                          name: controller.timeName[index],
                          color: AppColor.primaryColor,
                          dataSource: controller.listDataSource(index),
                          xValueMapper: (data, _) => data.dayIndex,
                          yValueMapper: (data, _) => data.minutes,
                        ),
                      ]),
            );
          }
        ),
      ),
    );
  }
}