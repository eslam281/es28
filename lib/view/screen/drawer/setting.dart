import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../main.dart';
import '../../../controller/drawer/sittings_controller.dart';
import '../../../core/constant/color.dart';
import '../../component/chooseFontSize.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SittingsControllerImp>(builder: (controller) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(
            "الإعدادات",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        body: Container(
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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                _buildSectionHeader(context, "المظهر العام"),
                const SizedBox(height: 15),

                /// تغيير الثيم (داكن / فاتح)
                _buildSettingCard(
                  context,
                  title: "الوضع الليلي",
                  subtitle: context.isDarkMode
                      ? "الوضع الحالي: داكن"
                      : "الوضع الحالي: فاتح",
                  icon: context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  trailing: Switch(
                    activeThumbColor: AppColor.secondColor,
                    value: context.isDarkMode,
                    onChanged: (_) => controller.changeThemeMode(),
                  ),
                  onTap: () => controller.changeThemeMode(),
                ),

                const SizedBox(height: 25),

                /// Color Palette Section
                _buildSectionHeader(context, "لوحة ألوان التطبيق"),
                const SizedBox(height: 15),
                Container(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppColor.listSecondColor.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final color = AppColor.listSecondColor[index];
                      final isSelected =
                          myBox?.get("secondColorIndex") == index;
                      return GestureDetector(
                        onTap: () => controller.selectColor(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: isSelected ? 65 : 50,
                          height: isSelected ? 65 : 50,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? Colors.white : Colors.transparent,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: color.withAlpha(isSelected ? 150 : 80),
                                blurRadius: isSelected ? 15 : 8,
                                spreadRadius: isSelected ? 2 : 0,
                              )
                            ],
                          ),
                          child: isSelected
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 35),
                _buildSectionHeader(context, "إعدادات النص"),
                const SizedBox(height: 15),

                /// حجم النص العام
                ChooseFontSize(
                  title: "حجم النص العام",
                  subtitle: "تغيير حجم الخط في القوائم والواجهات",
                  onPressedIncrease: () => controller.changeTextScaler(0.1),
                  onPressedDecrease: () => controller.changeTextScaler(-0.1),
                ),

                const SizedBox(height: 15),

                /// حجم نص الأذكار
                ChooseFontSize(
                  title: "حجم نص الأذكار",
                  subtitle: "تغيير حجم خط الأذكار والقراءة",
                  onPressedIncrease: () => controller.changeTextScalerAthkar(0.1),
                  onPressedDecrease: () => controller.changeTextScalerAthkar(-0.1),
                ),

                const SizedBox(height: 50),
                Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Column(
                      children: [
                        const Icon(Icons.info_outline_rounded, size: 30),
                        const SizedBox(height: 8),
                        Text(
                          "نسخة التطبيق 1.2.0",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          color: AppColor.secondColor,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildSettingCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Widget trailing,
    required VoidCallback onTap,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? Colors.white.withAlpha(10)
                : Colors.black.withAlpha(5),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColor.secondColor.withAlpha(30)),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            leading: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.secondColor.withAlpha(30),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: AppColor.secondColor, size: 24),
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            trailing: trailing,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
