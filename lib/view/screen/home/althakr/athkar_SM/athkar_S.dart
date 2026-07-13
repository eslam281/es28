import 'package:es28/view/screen/home/althakr/elathakerEditPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/althakr/athkar_S_controller.dart';
import '../../../../../controller/drawer/sittings_controller.dart';
import '../../../../../core/constant/color.dart';
import '../../../../component/athkar/customAthkarCard.dart';
import '../../../../component/athkar/customTopPage.dart';

class AthkarS extends StatelessWidget {
  const AthkarS({super.key});

  @override
  Widget build(BuildContext context) {
    AthkarSController controller = Get.put(AthkarSController());
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text(
            'أذكار المساء',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh_rounded, color: AppColor.secondColor),
              onPressed: () => controller.customRefresh(),
              padding: const EdgeInsets.only(right: 20),
              tooltip: 'تحديث الأذكار',
            )
          ],
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.secondColor.withAlpha(100),
                blurRadius: 15,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: FloatingActionButton(
            backgroundColor: AppColor.secondColor,
            onPressed: () {
              Get.to(ElathakerEditPage(controller: controller));
            },
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
          ),
        ),
        body: GetBuilder<SittingsControllerImp>(builder: (sittingsControllerImp) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: context.isDarkMode
                    ? [Colors.black, Colors.grey.shade900, Colors.black]
                    : [Colors.white, Colors.grey.shade100, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomTopPage(
                      changeThemeMode: () => sittingsControllerImp.changeThemeMode(),
                      restore: () => controller.restore(),
                      increaseTextSize: () =>
                          sittingsControllerImp.changeTextScalerAthkar(0.1),
                      decreaseTextSize: () =>
                          sittingsControllerImp.changeTextScalerAthkar(-0.1),
                    ),
                    GetBuilder<AthkarSController>(
                      builder: (controller) => ListView.builder(
                        padding:
                            const EdgeInsets.only(left: 20, bottom: 100, right: 20, top: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.athkar.length,
                        itemBuilder: (context, index) {
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
                              Get.to(ElathakerEditPage(index: index, controller: controller));
                            },
                            delete: () {
                              controller.delete(index);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
