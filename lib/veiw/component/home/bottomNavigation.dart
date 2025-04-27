import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return BottomNavigationBar(
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
          ],selectedItemColor: AppColor.secondColor,backgroundColor: AppColor.grey,
        );
      }
    );
  }
}
