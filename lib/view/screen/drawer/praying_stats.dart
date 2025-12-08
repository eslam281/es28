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
    final controller = Get.put(PrayingStatsController());

    return DefaultTabController(
      length: controller.timeName.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            labelColor: AppColor.secondColor,
            unselectedLabelColor: Colors.grey[600],
            indicatorColor: AppColor.secondColor,
            tabs: controller.timeName.map((t) => Tab(text: t)).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<PrayingStatsController>(
            builder: (controller) {
              if (controller.timings == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return TabBarView(
                children: List.generate(
                  controller.timeName.length,
                      (index) => SfCartesianChart(
                    primaryXAxis: const NumericAxis(
                      title: AxisTitle(text: "يوم"),
                    ),
                    primaryYAxis: NumericAxis(
                      axisLabelFormatter: (args) {
                        return ChartAxisLabel(
                          minutesToTimeLabel(args.value.toInt()),
                          args.textStyle,
                        );
                      },
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    onTooltipRender: (TooltipArgs args) {
                      final minutes = args
                          .dataPoints![args.pointIndex!.toInt()].y.toInt();
                      args.text = "اليوم ${args.pointIndex! + 1}\n"
                          "الوقت ${minutesToTimeLabel(minutes)}";
                    },
                    legend: const Legend(isVisible: true),

                    series: <CartesianSeries>[
                      LineSeries<PrayerTimePoint, int>(
                        name: controller.timeName[index],
                        color: AppColor.secondColor,
                        width:6,
                        dataSource: controller.listDataSource(index),
                        xValueMapper: (data, _) => data.dayIndex,
                        yValueMapper: (data, _) => data.minutes,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
