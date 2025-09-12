
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/timesfor30_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/converTime24_12.dart';
import '../../../core/localization/locationTranslations.dart';
import '../../component/home/timeTile.dart';

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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                /// Header: التاريخ + الموقع + تحديث
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(getMonth(controller.dateResponse!),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          getLocalizedLocation(controller.locationList[1]),
                          style: const TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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

                const SizedBox(height: 20),

                /// جدول المواقيت
                Expanded(
                  child: controller.data == null
                      ? const Center(child: Text("لا توجد بيانات"))
                      : SingleChildScrollView(
                    scrollDirection: Axis.horizontal, // يسمح بالتمرير لو الجدول كبير
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        headingTextStyle:const TextStyle(color: AppColor.secondColor,fontSize: 16,fontWeight: FontWeight.bold) ,
                        border: TableBorder.all(color: Colors.grey.shade300),
                        columns: const [
                          DataColumn(label: Text("اليوم")),
                          DataColumn(label: Text("الفجر")),
                          DataColumn(label: Text("الشروق")),
                          DataColumn(label: Text("الظهر")),
                          DataColumn(label: Text("العصر")),
                          DataColumn(label: Text("المغرب")),
                          DataColumn(label: Text("العشاء")),
                          DataColumn(label: Text("الثلث الأخير من الليل")),
                        ],
                        rows: List.generate(
                          controller.data!.length,
                              (index) {
                            final item = controller.data![index];
                            return DataRow(
                              cells: [
                                DataCell(Text("${index + 1}")),
                                DataCell(Text(item.fajr?.substring(0, 5) ?? "")),
                                DataCell(Text(item.sunrise?.substring(0, 5) ?? "")),
                                DataCell(Text(convertF(item.dhuhr!))),
                                DataCell(Text(convertF(item.asr!))),
                                DataCell(Text(convertF(item.maghrib!))),
                                DataCell(Text(convertF(item.isha!))),
                                DataCell(Center(child: Text(item.lastthird?.substring(0, 5) ?? ""))),
                              ],
                            );
                          },
                        ),
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