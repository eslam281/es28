import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:es28/veiw/screen/drawer/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/count_controller.dart';
import '../../controller/home_controller.dart';
import '../../core/functions/alertexitapp.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    CountControllerImp controllerCount = Get.put(CountControllerImp());

    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButton: (controller.index == 0)
            ? SizedBox(
                width: 70,
                child: FloatingActionButton(
                    onPressed: () {
                      controllerCount.seti();
                      controllerCount.setCounter("ادخل الذكر ",context);
                    },
                    child: const Column(
                      children: [
                        SizedBox(height: 3),

                        Icon(Icons.settings_backup_restore_outlined,
                          size: 30,),

                        const Text(
                          "إعادة ضبط",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    backgroundColor: Colors.blue),
              ) : null,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.black,
          title:Image.asset(AppImageAsset.titleimage,width: 220,height: 120,),
          centerTitle:true,
        ),
        drawer: Drawer(
          width: 220,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              textDirection:TextDirection.rtl,
              children: [
                const SizedBox(
                  height: 100,
                ),
                ListTile(
                    title: const Text("اتصل بنا"),
                    leading: const Icon(Icons.comment_outlined),
                    onTap: () async {
                      // await launchUrl(Uri.parse("https://wa.me/201064744978"));
                      // await launchUrl(Uri.parse("tel:0201064744978"));
                      await launchUrl(
                          Uri.parse("mailto:aslamsydbdalzyzbry@gmail.com"));
                    }),
                Container(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                      title: const Text("معلومات عنا"), leading: const Icon(Icons.info),
                    onTap: () {
                      Get.to(() => const About_us());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (val) {
              controller.setIndex(val);
            },
            currentIndex: controller.index,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "الصفحة الرئسية"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_time), label: "أوقات الصلاة"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book_outlined), label: "الاذكار"),
            ],selectedItemColor: AppColor.primaryColor,
        ),
        body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              return alertExitApp();
            },
            child: Container(
                color: AppColor.black,
                height: double.infinity,
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: controller.bodyList[controller.index],
                ))),
      );
    });
  }
}
