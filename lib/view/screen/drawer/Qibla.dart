import 'dart:math' as math;
import 'dart:ui';

import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/Qibla_controller.dart';
import '../../../core/constant/color.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QiblaControllerImp());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('بوصلة القبلة', style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.secondColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: context.isDarkMode
                ? [Colors.indigo.shade900, Colors.black]
                : [AppColor.secondColor.withAlpha(50), Colors.white],
            center: Alignment.center,
            radius: 1.2,
          ),
        ),
        child: GetBuilder<QiblaControllerImp>(builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: StreamBuilder<CompassEvent>(
              stream: FlutterCompass.events,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error reading compass'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                double? direction = snapshot.data?.heading;
                if (direction == null) {
                  return const Center(child: Text("جهازك لا يدعم البوصلة"));
                }

                double angle = (controller.qiblaDirection - direction) * (math.pi / 180);

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background Glow for Compass
                    Container(
                      width: 320,
                      height: 320,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.secondColor.withAlpha(30),
                            blurRadius: 60,
                            spreadRadius: 20,
                          )
                        ],
                      ),
                    ),

                    // Compass Scale (Decorative)
                    Opacity(
                      opacity: 0.1,
                      child: Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.secondColor, width: 2),
                        ),
                      ),
                    ),

                    // Rotating Compass
                    Center(
                      child: Transform.rotate(
                        angle: angle,
                        child: Container(
                          width: 260,
                          height: 260,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColor.secondColor.withAlpha(50),
                                blurRadius: 20,
                                spreadRadius: 2,
                              )
                            ],
                            image: const DecorationImage(
                              image: AssetImage(AppImageAsset.qibla),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Direction Indicator (Static arrow on top)
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        children: [
                          Icon(Icons.arrow_drop_down_rounded, size: 60, color: AppColor.secondColor),
                          const SizedBox(height: 5),
                          const Text(
                            "وجه الهاتف نحو القبلة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Info Card at Bottom
                    Positioned(
                      bottom: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            decoration: BoxDecoration(
                              color: AppColor.secondColor.withAlpha(20),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColor.secondColor.withAlpha(50)),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "${controller.qiblaDirection.toInt()}°",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w900,
                                    color: AppColor.secondColor,
                                  ),
                                ),
                                const Text(
                                  "زاوية القبلة لموقعك الحالي",
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
