import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/athkar/customBouttonMain.dart';
import 'package:es28/core/constant/color.dart';

class Althakr extends StatelessWidget {
  const Althakr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: context.isDarkMode
              ? [Colors.black, Colors.grey.shade900]
              : [Colors.white, Colors.grey.shade100],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// Premium Header
            Text(
              'الأذكار اليومية',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppColor.secondColor,
                letterSpacing: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "نور قلبك بذكر الله",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            /// Dynamic Grid of Athkar
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
              children: const [
                CustomButtonMain(
                  name: "أذكار الصباح والمساء",
                  pageName: AppRoute.athkar_SM,
                  icon: Icons.wb_sunny_rounded,
                ),
                CustomButtonMain(
                  name: "أذكار بعد الصلاة",
                  pageName: AppRoute.athkarAP,
                  icon: Icons.access_time_filled_rounded,
                ),
                CustomButtonMain(
                  name: "أذكار يوم الجمعة",
                  pageName: AppRoute.athkarFriday,
                  icon: Icons.calendar_today_rounded,
                ),
                // Potential placeholder for more or just leave as is
              ],
            ),
            
            const SizedBox(height: 40),
            // Subtle Quote or Decoration
            Opacity(
              opacity: 0.3,
              child: Column(
                children: [
                  const Icon(Icons.auto_awesome_rounded, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    "فَاذْكُرُونِي أَذْكُرْكُمْ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
