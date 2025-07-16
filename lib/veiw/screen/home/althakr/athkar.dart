import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';

import '../../../component/athkar/customBouttonMain.dart';

class Althakr extends StatelessWidget {
  const Althakr({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /// Title
            Text(
              'اختر نوع الذكر',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40),

            /// Morning & Evening Athkar
            CustomButtonMain(
              name: "أذكار الصباح والمساء",
              pageName: AppRoute.athkar_SM,
              icon: Icons.wb_sunny,
            ),
            SizedBox(height: 20),

            /// After Prayer Athkar
            CustomButtonMain(
              name: "أذكار بعد الصلاة",
              pageName: AppRoute.athkarAP,
              icon: Icons.access_time_filled,
            ),
            SizedBox(height: 20),

            /// Friday Athkar
            CustomButtonMain(
              name: "أذكار يوم الجمعة",
              pageName: AppRoute.athkarFriday,
              icon: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }
}
