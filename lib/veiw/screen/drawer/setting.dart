import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/sittings_controller.dart';
import '../../../core/constant/color.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SittingsControllerImp controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text("الإعدادات"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// تغيير الثيم (داكن / فاتح)
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.secondColor.withOpacity(0.1),
                child: Icon(
                  context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: AppColor.secondColor,
                ),
              ),
              title: const Text(
                "الوضع الليلي",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                context.isDarkMode ? "الوضع الحالي: داكن" : "الوضع الحالي: فاتح",
              ),
              trailing: Switch(
                activeColor: AppColor.secondColor,
                value: context.isDarkMode,
                onChanged: (_) => controller.changeThemeMode(),
              ),
              onTap: () => controller.changeThemeMode(),
            ),
          ),

          const SizedBox(height: 20),

          /// حجم النص
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColor.secondColor.withOpacity(0.1),
                child: const Icon(Icons.text_fields, color: AppColor.secondColor),
              ),
              title: const Text(
                "حجم النص",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: const Text("قم بتكبير أو تصغير حجم النص"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Text("-A", style: TextStyle(color: AppColor.secondColor)),
                    onPressed: () => controller.changeTextScaler(-0.1),
                  ),
                  IconButton(
                    icon: const Text("+A", style: TextStyle(color: AppColor.secondColor)),
                    onPressed: () => controller.changeTextScaler(0.1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
