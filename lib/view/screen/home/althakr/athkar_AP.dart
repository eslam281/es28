import 'package:es28/controller/drawer/sittings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/althakr/athakerAP_controller.dart';
import '../../../../controller/althakr/elathakerEditPage.dart';
import '../../../../core/constant/color.dart';
import '../../../component/athkar/customAthkarCard.dart';
import '../../../component/athkar/customTopPage.dart';

class AthkarAP extends StatelessWidget {
  const AthkarAP({super.key});

  @override
  Widget build(BuildContext context) {
    athakerAPController controller = Get.put(athakerAPController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'أذكار بعد الصلاة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: AppColor.secondColor),
            onPressed: () => controller.customRefresh(),
            padding: const EdgeInsets.only(right: 20),
            tooltip: 'تحديث الأذكار',
          )
        ],
      ),
        floatingActionButton:FloatingActionButton(
          backgroundColor: AppColor.secondColor,
          onPressed: () {
            Get.to( ElathakerEditPage(controller: controller));
          },
          child: const Icon(Icons.add),
        ),

      body:  GetBuilder<SittingsControllerImp>(
        builder: (sittingsControllerImp) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomTopPage(
                  changeThemeMode:() => sittingsControllerImp.changeThemeMode() ,
                  restore:() => controller.restore() ,
                  increaseTextSize:() => sittingsControllerImp.changeTextScalerAthkar(0.1) ,
                  decreaseTextSize:() => sittingsControllerImp.changeTextScalerAthkar(-0.1) ,
                ),
              GetBuilder<athakerAPController>(
              builder: (controller) =>
                ListView.builder(
                  padding: const EdgeInsets.only(left: 20, bottom: 30,right: 20,top:10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.athkar.length,
                  itemBuilder: (context, index){
                      bool completed =
                          controller.count[index] >= controller.athkar[index][1];
                      return CustomAthkarCard(
                        elthakr: controller.athkar[index][0],
                        count: controller.count[index],
                        completed: completed,
                        max: controller.athkar[index][1],
                        textScaler: sittingsControllerImp.textScalerAthkar,
                        onTap: () {
                          controller.onTap(index);
                        },
                        edit: () {
                          Get.to(ElathakerEditPage(index: index,controller: controller));
                        },
                        delete: () {
                          controller.delete(index);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }
}
