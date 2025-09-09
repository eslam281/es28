import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/imageasset.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 240,
      elevation: 10,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Logo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal:5),
              child: Image.asset(
                AppImageAsset.logo,
                width: 200,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            /// Divider
            Divider(color: Colors.grey.shade700, thickness: 1),

            const SizedBox(height: 30,),

            /// Qibla
            _drawerTile(
              icon: Icons.explore,
              title: 'القبلة',
              onTap: () => Get.toNamed(AppRoute.qiblaPage),
            ),

            /////
            _drawerTile(
              icon: Icons.explore,
              title: 'time30',
              onTap: () => Get.toNamed(AppRoute.qiblaPage),
            ),
            ///Alarm
            _drawerTile(
              icon: Icons.alarm,
              title: 'المنبه',
              onTap: () => Get.toNamed(AppRoute.alarm),
            ),
            ////Setting
            _drawerTile(
              icon: Icons.settings,
              title: 'الإعدادات',
              onTap: () => Get.toNamed(AppRoute.setting),
            ),

            /// Contact Us
            _drawerTile(
              icon: Icons.contact_mail,
              title: 'اتصل بنا',
              onTap: () => Get.toNamed(AppRoute.contact_us),
            ),

            /// About Us
            _drawerTile(
              icon: Icons.info_outline,
              title: 'معلومات عنا',
              onTap: () => Get.toNamed(AppRoute.about_us),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Icon(
        icon,
        color: AppColor.secondColor,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        textDirection: TextDirection.rtl,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      hoverColor: AppColor.secondColor.withAlpha(45),
      onTap: onTap,
    );
  }
}
