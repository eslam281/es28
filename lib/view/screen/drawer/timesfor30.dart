
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
      appBar: AppBar(
        title: const Text("مواقيت الصلاة لشهر"),
        centerTitle: true,
      ),
      body: GetBuilder<Timesfor30Controller>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              children: [
                /// Header: التاريخ + الموقع + تحديث
                TimesCard(
                    textDate: getMonth(controller.dateResponse!)??"",
                    textLocation: getLocalizedLocation(controller.locationList[1]),
                    isReady: controller.isready,
                    reTimes: controller.reTimes
                ),

                const SizedBox(height: 20),

                /// جدول المواقيت
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Expanded(
                    child: controller.data == null
                        ? const ShimmerReload()
                        : SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // يسمح بالتمرير لو الجدول كبير
                      child: Column(
                        children: [
                          DataTable(
                            headingTextStyle: const TextStyle(
                              color: AppColor.secondColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            columnSpacing: 0,
                            columns: const [
                              DataColumn(label: SizedBox(width: 30, child: Center(child: Text("اليوم")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("الفجر")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("الشروق")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("الظهر")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("العصر")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("المغرب")))),
                              DataColumn(label: SizedBox(width: 70, child: Center(child: Text("العشاء")))),
                              DataColumn(
                                label: SizedBox(
                                  width: 90,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text("الثلث الأخير"),
                                        Text("من الليل"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            rows: const [],
                          ),



                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: DataTable(
                                headingRowHeight: 0,
                                columnSpacing: 0,
                                dataRowMinHeight: 30,
                                dataRowMaxHeight: 40,
                                dividerThickness: .2,
                                columns: const [
                                  DataColumn(label: SizedBox()), // هيدر مخفي
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                  DataColumn(label: SizedBox()),
                                ],
                                rows: List.generate(
                                  controller.data!.length,
                                      (index) {
                                    final item = controller.data![index];
                                    return DataRow(
                                      color: index+1==DateTime.now().day?
                                      WidgetStateProperty.all(AppColor.primaryColor):null,
                                      cells: [
                                        DataCell(SizedBox(width: 30, child: Text("${index + 1}"),),),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(item.fajr?.substring(0, 5) ?? "")))),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(item.sunrise?.substring(0, 5) ?? "")))),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(convertF(item.dhuhr!))))),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(convertF(item.asr!))))),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(convertF(item.maghrib!))))),
                                        DataCell(SizedBox(width: 70, child: Center(child: Text(convertF(item.isha!))))),
                                        DataCell(SizedBox(width: 90, child: Center(child: Text(item.lastthird?.substring(0, 5) ?? "")))),

                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}