import 'dart:io';

import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/functions/alertexitapp.dart';
import '../component/home/bottomNavigation.dart';
import '../component/drawer/drawer.dart';
import '../component/home/floatingActionButton.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return Scaffold(
        extendBody: true, // Allow body to extend behind the navigation bar
        floatingActionButton: (controller.index == 0)
            ? const CustomFloatingActionButton()
            : null,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          title: Hero(
            tag: 'logo',
            child: Image.asset(
              AppImageAsset.titleimage,
              width: 180,
              color: AppColor.secondColor,
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu_open_rounded, size: 30),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        endDrawer: const CustomDrawer(),
        bottomNavigationBar: const CustomBottomNavigation(),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            return alertApp("هل تريد الخروج من التطبيق", "خروج", exit(0));
          },
          child: PageView(
            physics: const BouncingScrollPhysics(),
            children: controller.bodyList,
            onPageChanged: (val) {
              controller.setIndex(val);
            },
            controller: controller.pageController,
          ),
        ),
      );
    });
  }
}
