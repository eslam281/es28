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
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColor.secondColor,
          selectedIconTheme: const IconThemeData(size: 32),
          unselectedIconTheme: const IconThemeData(size: 24),
          items: [
            _animatedBarItem(
              icon: Icons.home,
              label: "الصفحة الرئسية",
              isActive: controller.index == 0,
            ),
            _animatedBarItem(
              icon: Icons.access_time,
              label: "أوقات الصلاة",
              isActive: controller.index == 1,
            ),
            _animatedBarItem(
              icon: Icons.menu_book_outlined,
              label: "الأذكار",
              isActive: controller.index == 2,
            ),
          ],
        );
      },
    );
  }

  BottomNavigationBarItem _animatedBarItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor.withAlpha(55) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}
