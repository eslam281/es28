import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/timesfor30_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/converTime24_12.dart';
import '../../../core/localization/locationTranslations.dart';
import '../../../core/shared/shimmerReload.dart';
import '../../component/home/times_card.dart';

class Timesfor30Widget extends StatelessWidget {
  const Timesfor30Widget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Timesfor30Controller());

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("مواقيت الشهر", style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900, Colors.black]
                : [Colors.white, Colors.grey.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: GetBuilder<Timesfor30Controller>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    /// Header Card
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: TimesCard(
                          textDate: getMonth(controller.dateResponse!) ?? "",
                          textLocation: getLocalizedLocation(controller.locationList[1]),
                          isReady: controller.isready,
                          reTimes: controller.reTimes,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// Header Row for the list (All 7 times + Day)
                    _buildTableHeader(context),

                    const SizedBox(height: 10),

                    /// Prayer Times List
                    Expanded(
                      child: controller.data == null
                          ? const ShimmerReload()
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controller.data!.length,
                              itemBuilder: (context, index) {
                                final item = controller.data![index];
                                final isToday = index + 1 == DateTime.now().day;
                                return _buildPrayerDayCard(context, index + 1, item, isToday);
                              },
                            ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColor.secondColor.withAlpha(20),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _HeaderCell("الثلث الأخير", flex: 2),
          _HeaderCell("عشاء", flex: 2),
          _HeaderCell("مغرب", flex: 2),
          _HeaderCell("عصر", flex: 2),
          _HeaderCell("ظهر", flex: 2),
          _HeaderCell("شروق", flex: 2),
          _HeaderCell("فجر", flex: 2),
          _HeaderCell("اليوم", flex: 1),
        ],
      ),
    );
  }

  Widget _buildPrayerDayCard(BuildContext context, int day, dynamic item, bool isToday) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: isToday ? Border.all(color: AppColor.secondColor, width: 2) : null,
        boxShadow: isToday
            ? [
                BoxShadow(
                  color: AppColor.secondColor.withAlpha(60),
                  blurRadius: 8,
                  spreadRadius: 1,
                )
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            decoration: BoxDecoration(
              color: isToday
                  ? AppColor.secondColor.withAlpha(30)
                  : (context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _DataCell(item.lastthird?.substring(0, 5) ?? "--:--", flex: 2, isBold: isToday),
                _DataCell(convertF(item.isha!).substring(0, 5), flex: 2, isBold: isToday),
                _DataCell(convertF(item.maghrib!).substring(0, 5), flex: 2, isBold: isToday),
                _DataCell(convertF(item.asr!).substring(0, 5), flex: 2, isBold: isToday),
                _DataCell(convertF(item.dhuhr!).substring(0, 5), flex: 2, isBold: isToday),
                _DataCell(item.sunrise?.substring(0, 5) ?? "--:--", flex: 2, isBold: isToday),
                _DataCell(item.fajr?.substring(0, 5) ?? "--:--", flex: 2, isBold: isToday),
                _DataCell("$day", flex: 1, isBold: isToday),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final int flex;
  const _HeaderCell(this.text, {required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.secondColor,
            fontSize: 10, // Small font to fit 8 columns
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final int flex;
  final bool isBold;
  const _DataCell(this.text, {required this.flex, this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 11, // Small font to fit 8 columns
            fontWeight: isBold ? FontWeight.w900 : FontWeight.normal,
            color: isBold ? AppColor.secondColor : null,
          ),
        ),
      ),
    );
  }
}
