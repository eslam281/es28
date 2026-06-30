import 'dart:ui';
import 'package:es28/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/times_controller.dart';
import '../../../core/functions/converTime24_12.dart';
import '../../../core/localization/locationTranslations.dart';
import '../../../core/shared/shimmerReload.dart';
import '../../component/home/timeTile.dart';

class Times extends StatelessWidget {
  const Times({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimesController());

    return GetBuilder<TimesController>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Stack(
          children: [
            // 1. Dynamic Background Image
            _buildDynamicBackground(context, controller),

            // 2. Main Content
            Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  // Luxury Header with Next Prayer Countdown
                  SliverAppBar(
                    expandedHeight: 320,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: FlexibleSpaceBar(
                      background: _buildLuxuryHeader(context, controller),
                    ),
                  ),

                  // Staggered Prayer Tiles
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        if (controller.data != null) ...[
                          LuxuryTimeTile(
                            title: "الفجر",
                            time: controller.data!.fajr!,
                            icon: Icons.wb_twilight_rounded,
                            accentColor: Colors.blue.shade300,
                            isNext: controller.nextPrayerName == "الفجر",
                          ),
                          LuxuryTimeTile(
                            title: "الشروق",
                            time: controller.data!.sunrise!,
                            icon: Icons.wb_sunny_rounded,
                            accentColor: Colors.orange.shade300,
                            isNext: controller.nextPrayerName == "الشروق",
                          ),
                          LuxuryTimeTile(
                            title: "الظهر",
                            time: convertF(controller.data!.dhuhr!),
                            icon: Icons.sunny,
                            accentColor: Colors.amber.shade600,
                            isNext: controller.nextPrayerName == "الظهر",
                          ),
                          LuxuryTimeTile(
                            title: "العصر",
                            time: convertF(controller.data!.asr!),
                            icon: Icons.wb_cloudy_rounded,
                            accentColor: Colors.orange.shade800,
                            isNext: controller.nextPrayerName == "العصر",
                          ),
                          LuxuryTimeTile(
                            title: "المغرب",
                            time: convertF(controller.data!.maghrib!),
                            icon: Icons.nights_stay_rounded,
                            accentColor: Colors.red.shade400,
                            isNext: controller.nextPrayerName == "المغرب",
                          ),
                          LuxuryTimeTile(
                            title: "العشاء",
                            time: convertF(controller.data!.isha!),
                            icon: Icons.dark_mode_rounded,
                            accentColor: Colors.indigo.shade400,
                            isNext: controller.nextPrayerName == "العشاء",
                          ),
                          
                          const SizedBox(height: 10),
                          
                          // Night Third - Jewel Style
                          LuxuryTimeTile(
                            title: "الثلث الأخير من الليل",
                            time: controller.data!.lastthird!,
                            icon: Icons.auto_awesome_rounded,
                            accentColor: Colors.purple.shade300,
                          ),
                        ] else
                          const ShimmerReload(),
                        const SizedBox(height: 100),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildDynamicBackground(BuildContext context, TimesController controller) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.currentBackgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withAlpha(200),
              Colors.transparent,
              context.isDarkMode ? Colors.black : Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildLuxuryHeader(BuildContext context, TimesController controller) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Date & Location (Glass)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.white.withAlpha(30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Text(
                        getLocalizedLocation(controller.locationList[1]),
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        controller.dateResponse ?? "",
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Countdown Circle
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 160,
                  height: 160,
                  child: CircularProgressIndicator(
                    value: 1.0, 
                    strokeWidth: 6,
                    color: Colors.white.withAlpha(80),
                  ),
                ),
                // Inner Glassy Circle for Contrast
                Container(
                  width: 145,
                  height: 145,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withAlpha(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(20),
                        blurRadius: 15,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      controller.nextPrayerName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                        shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatDuration(controller.timeToNextPrayer),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'monospace',
                        shadows: [Shadow(color: Colors.black, blurRadius: 15)],
                      ),
                    ),
                    const Text(
                      "متبقي حتى الصلاة",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
