import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/sittings_controller.dart';
import '../../../core/constant/color.dart';
import '../../component/chooseFontSize.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SittingsControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "الإعدادات",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            _buildSectionHeader(context, "المظهر العام"),
            const SizedBox(height: 10),

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

            const SizedBox(height: 15),

            /// تغيير اللون
            _buildSettingCard(
              context,
              title: "لون التطبيق",
              subtitle: "تغيير اللون الأساسي للتطبيق",
              icon: Icons.palette_outlined,
              trailing: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.secondColor.withAlpha(100),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
              ),
              onTap: () => controller.changeColor(),
            ),

            const SizedBox(height: 30),
            _buildSectionHeader(context, "إعدادات النص"),
            const SizedBox(height: 10),

            /// حجم النص العام
            ChooseFontSize(
              title: "حجم النص العام",
              subtitle: "تغيير حجم الخط في القوائم والواجهات",
              onPressedIncrease: () => controller.changeTextScaler(0.1),
              onPressedDecrease: () => controller.changeTextScaler(-0.1),
            ),

            const SizedBox(height: 10),

            /// حجم نص الأذكار
            ChooseFontSize(
              title: "حجم نص الأذكار",
              subtitle: "تغيير حجم خط الأذكار والقراءة",
              onPressedIncrease: () => controller.changeTextScalerAthkar(0.1),
              onPressedDecrease: () => controller.changeTextScalerAthkar(-0.1),
            ),
            
            const SizedBox(height: 40),
            Center(
              child: Opacity(
                opacity: 0.5,
                child: Column(
                  children: [
                    const Icon(Icons.info_outline, size: 30),
                    const SizedBox(height: 8),
                    Text(
                      "نسخة التطبيق 1.0.0",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            )
          ],
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
          fontSize: 14,
          fontWeight: FontWeight.bold,
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
    return Card(
      elevation: 2,
      shadowColor: AppColor.secondColor.withAlpha(30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.secondColor.withAlpha(30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColor.secondColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
