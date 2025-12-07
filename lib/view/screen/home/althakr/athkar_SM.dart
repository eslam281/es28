import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/althakr/elathaker_controller.dart';
import '../../../../controller/drawer/sittings_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/alertexitapp.dart';
import '../../../component/athkar/customAthkarCard.dart';

class AthkarSM extends StatelessWidget {
  const AthkarSM({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'الأذكار اليومية',
            style: TextStyle( fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh, color: AppColor.secondColor),
              onPressed: () => controller.customRefresh(),
              padding: const EdgeInsets.only(right: 20),
              tooltip: 'تحديث الأذكار',
            )
          ],
        ),

        floatingActionButton:FloatingActionButton(
          backgroundColor: AppColor.secondColor,
          onPressed: () {  },
          child: const Icon(Icons.add),
        ),

        body: GetBuilder<SittingsControllerImp>(
          builder: (sittingsControllerImp) {
            return SingleChildScrollView(

              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                        children: [
                           CircleAvatar(
                              backgroundColor: AppColor.secondColor.withAlpha(30),
                              child: IconButton(
                                icon: Icon(
                                  context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                                  color: AppColor.secondColor,
                                ),
                                onPressed:() => sittingsControllerImp.changeThemeMode() ,
                              ),
                            ),
                          CircleAvatar(
                              backgroundColor: AppColor.secondColor.withAlpha(30),
                              child: IconButton(
                                icon: Icon(Icons.restore_page_outlined,
                                  color: AppColor.secondColor,
                                ),
                                onPressed:() {
                                  alertApp("do want to restore all data",
                                          () => controller.restore());
                                  } ,
                              ),
                            ),
                          Row(children: [
                            CircleAvatar(
                              backgroundColor: AppColor.secondColor.withAlpha(30),
                              child: const Icon(Icons.text_fields, color: AppColor.secondColor),
                            ),
                            IconButton(
                              icon: const Text("-A", style: TextStyle(color: AppColor.secondColor)),
                              onPressed:() => sittingsControllerImp.changeTextScalerAthkar(0.1),
                            ),
                            IconButton(
                              icon: const Text("+A", style: TextStyle(color: AppColor.secondColor)),
                              onPressed: () => sittingsControllerImp.changeTextScalerAthkar(-0.1),
                            ),
                          ],)
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<ElathakerController>(
                  builder: (controller) => ListView.builder(
                    padding: const EdgeInsets.only(
                        left: 20, bottom: 30, right: 20, top: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.athkar.length,
                    itemBuilder: (context, index) {
                      bool completed = controller.count[index] >=
                          controller.athkar[index][1];
                      return CustomAthkarCard(
                        elthakr: controller.athkar[index][0],
                        count: controller.count[index],
                        completed: completed,
                        max: controller.athkar[index][1],
                        textScaler: sittingsControllerImp.textScalerAthkar,
                        onTap: () {
                          controller.onTap(index);
                        },
                        edit: () {},
                        delete: () {
                          controller.delete(index);
                        },
                      );
                    },
                  ),
                )
              ],
              ),
            );
          }
        )
    );
  }
}
