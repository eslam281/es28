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
      width: 280,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// Header with Gradient and Logo
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColor.secondColor,
                  AppColor.secondColor.withAlpha(180),
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImageAsset.logo,
                    width: 70,
                    height: 70,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "تطبيق المسلم",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: [
                _drawerTile(
                  icon: Icons.explore_rounded,
                  title: 'القبلة',
                  onTap: () => Get.toNamed(AppRoute.qiblaPage),
                ),
                _drawerTile(
                  icon: Icons.calendar_month_rounded,
                  title: 'مواقيت الصلاة لشهر',
                  onTap: () => Get.toNamed(AppRoute.timesfor30),
                ),
                _drawerTile(
                  icon: Icons.analytics_rounded,
                  title: 'إحصائيات الأوقات',
                  onTap: () => Get.toNamed(AppRoute.prayingStats),
                ),
                const Divider(indent: 20, endIndent: 20),
                _drawerTile(
                  icon: Icons.settings_rounded,
                  title: 'الإعدادات',
                  onTap: () => Get.toNamed(AppRoute.setting),
                ),
                _drawerTile(
                  icon: Icons.contact_support_rounded,
                  title: 'اتصل بنا',
                  onTap: () => Get.toNamed(AppRoute.contact_us),
                ),
                _drawerTile(
                  icon: Icons.info_rounded,
                  title: 'عن التطبيق',
                  onTap: () => Get.toNamed(AppRoute.about_us),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        leading: Icon(
          icon,
          color: AppColor.secondColor,
          size: 24,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          textDirection: TextDirection.rtl,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onTap: onTap,
        tileColor: AppColor.secondColor.withAlpha(10),
      ),
    );
  }
}
