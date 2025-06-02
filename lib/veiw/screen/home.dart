import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/functions/alertexitapp.dart';
import '../component/home/bottomNavigation.dart';
import '../component/home/drawer.dart';
import '../component/home/floatingActionButton.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButton:(controller.index == 0)?
          const CustomFloatingActionButton():null,

        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColor.secondColor),
          foregroundColor:Colors.white,backgroundColor:AppColor.black,centerTitle:true,
          title:Padding(
            padding: const EdgeInsets.only(top:10),
            child: Image.asset(AppImageAsset.titleimage,width: 220,height: 130,),
          ),
        ),

        drawer:const CustomDrawer(),

        bottomNavigationBar:const CustomBottomNavigation() ,

        body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              return alertExitApp();
            },
            child: Container(
                color: AppColor.black,
                height: double.infinity,
                padding:  const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: controller.bodyList[controller.index],
                ))),
      );
    });
  }
}
