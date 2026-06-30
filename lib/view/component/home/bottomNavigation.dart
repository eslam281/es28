import 'dart:ui';
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
        return Container(
          margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.black.withAlpha(150)
                      : Colors.white.withAlpha(200),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: context.isDarkMode
                        ? Colors.white.withAlpha(30)
                        : Colors.black.withAlpha(20),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_rounded,
                      label: "الرئيسية",
                      isActive: controller.index == 0,
                      onTap: () => controller.onBottomNavTap(0),
                    ),
                    _buildNavItem(
                      icon: Icons.access_time_filled_rounded,
                      label: "المواقيت",
                      isActive: controller.index == 1,
                      onTap: () => controller.onBottomNavTap(1),
                    ),
                    _buildNavItem(
                      icon: Icons.menu_book_rounded,
                      label: "الأذكار",
                      isActive: controller.index == 2,
                      onTap: () => controller.onBottomNavTap(2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? AppColor.secondColor.withAlpha(40) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isActive ? AppColor.secondColor : Colors.grey.shade500,
              size: 28,
            ),
            if (isActive)
              Text(
                label,
                style: TextStyle(
                  color: AppColor.secondColor,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
