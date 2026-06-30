import 'dart:ui';
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
    return GetBuilder<PrayingStatsController>(builder: (controller) {
      return controller.timings == null
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : DefaultTabController(
              length: controller.timeName.length,
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  title: const Text("إحصائيات الأوقات", style: TextStyle(fontWeight: FontWeight.w900)),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: AppColor.secondColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: AppColor.secondColor,
                    dividerColor: Colors.transparent,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: controller.timeName.map((t) => Tab(text: t)).toList(),
                  ),
                ),
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: context.isDarkMode
                          ? [Colors.black, Colors.grey.shade900]
                          : [Colors.white, Colors.grey.shade100],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: AppColor.secondColor.withAlpha(30)),
                            ),
                            child: TabBarView(
                              children: List.generate(
                                controller.timeName.length,
                                (index) => _buildChart(context, controller, index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
    });
  }

  Widget _buildChart(BuildContext context, PrayingStatsController controller, int index) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
        title: AxisTitle(text: "اليوم", textStyle: TextStyle(color: AppColor.secondColor, fontWeight: FontWeight.bold)),
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        interval: 1,
        majorGridLines: MajorGridLines(color: AppColor.secondColor.withAlpha(30)),
        axisLabelFormatter: (args) {
          return ChartAxisLabel(
            minutesToTimeLabel(args.value.toInt()),
            args.textStyle.copyWith(color: Colors.grey),
          );
        },
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
        canShowMarker: true,
        color: AppColor.secondColor,
      ),
      onTooltipRender: (TooltipArgs args) {
        final minutes = args.dataPoints![args.pointIndex!.toInt()].y.toInt();
        args.text = "اليوم ${args.pointIndex! + 1}\n"
            "الوقت ${minutesToTimeLabel(minutes)}";
      },
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        textStyle: TextStyle(color: AppColor.secondColor, fontWeight: FontWeight.bold),
      ),
      series: <CartesianSeries>[
        LineSeries<PrayerTimePoint, int>(
          name: controller.timeName[index],
          color: AppColor.secondColor,
          width: 4,
          dataSource: controller.listDataSource(index),
          xValueMapper: (data, _) => data.dayIndex,
          yValueMapper: (data, _) => data.minutes,
          markerSettings: MarkerSettings(
            isVisible: true,
            shape: DataMarkerType.circle,
            width: 12,
            height: 12,
            color: AppColor.secondColor,
            borderWidth: 2,
            borderColor: Colors.white,
          ),
          animationDuration: 1500,
          enableTooltip: true,
        ),
      ],
      onMarkerRender: (MarkerRenderArgs args) {
        final todayIndex = DateTime.now().day - 1;
        if (args.pointIndex != todayIndex) {
          args.markerHeight = 0;
          args.markerWidth = 0;
        } else {
          args.color = context.isDarkMode ? Colors.white : Colors.black;
        }
      },
    );
  }
}
