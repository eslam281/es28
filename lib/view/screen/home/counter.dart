import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/count_controller.dart';
import '../../../core/constant/color.dart';
import '../../component/custom.dart';
import '../../component/dropdownlist.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CountControllerImp());
    return GetBuilder<CountControllerImp>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900, Colors.black]
                : [Colors.white, Colors.grey.shade100, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Column(
              children: [
                // Glassmorphic Input Card
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColor.secondColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColor.secondColor.withAlpha(50),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          AppTextField(
                            textEditingController: controller.textcontroll,
                            title: "",
                            hint: "اختر الذكر المطلوب",
                            isCitySelected: true,
                            cities: controller.itemsDropdown,
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () => controller.setCounter(
                                controller.textcontroll.text, context),
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.secondColor,
                                    AppColor.secondColor.withBlue(150),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColor.secondColor.withAlpha(100),
                                    blurRadius: 15,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  "تثبيت الذكر",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Display Name
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColor.secondColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    "${controller.counterName}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 50),
                // Glowing Counter Circle
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Outer Glow
                    Container(
                      width: 240,
                      height: 240,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.secondColor.withAlpha(40),
                            blurRadius: 50,
                            spreadRadius: 10,
                          )
                        ],
                      ),
                    ),
                    // Progress Indicator
                    SizedBox(
                      width: 210,
                      height: 210,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 12,
                        color: AppColor.secondColor.withAlpha(50),
                      ),
                    ),
                    // Inner Circle
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.isDarkMode
                            ? Colors.black
                            : Colors.white,
                        border: Border.all(
                          color: AppColor.secondColor.withAlpha(100),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "${controller.i}",
                          style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.w900,
                            color: AppColor.secondColor,
                            fontFamily: 'monospace',
                            shadows: [
                              Shadow(
                                color: AppColor.secondColor.withAlpha(100),
                                blurRadius: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                // Animated Custom Button Container
                Transform.scale(
                  scale: 1.1,
                  child: CustomButton(onPressed: controller.Addi),
                ),
                const SizedBox(height: 30),
                Text(
                  "انقر للذكر والاستغفار",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
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
}
