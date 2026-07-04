import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controller/althakr/prayElnaby_controller.dart';
import '../../../../../core/constant/color.dart';
import '../../../../component/custom.dart';
import '../../../../component/dropdownlist.dart';

class PrayElnaby extends StatelessWidget {
  const PrayElnaby({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrayElnabyControllerImp>(
        init: PrayElnabyControllerImp(),
        builder: (controller) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "الصلاة على النبي",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            floatingActionButton: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.secondColor,
                    AppColor.secondColor.withBlue(200),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.secondColor.withAlpha(100),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {
                    controller.seti();
                    controller.setCounter("ادخل الذكر ", context);
                  },
                  child: const Icon(
                    Icons.refresh_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: context.isDarkMode
                      ? [Colors.black, Colors.grey.shade900, Colors.black]
                      : [Colors.white, Colors.grey.shade100, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
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
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () => controller.setCounter(
                                        controller.textcontroll.text, context),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColor.secondColor,
                                            AppColor.secondColor.withBlue(150),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColor.secondColor.withAlpha(80),
                                            blurRadius: 10,
                                            offset: const Offset(0, 4),
                                          )
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "تثبيت الذكر",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
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
                        const SizedBox(height: 30),
                        // Display Name
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppColor.secondColor.withAlpha(30),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: AppColor.secondColor.withAlpha(50)),
                          ),
                          child: Text(
                            "${controller.counterName}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.secondColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 100),
                        Stack(alignment: Alignment.center, children: [
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
                                  color: context.isDarkMode ? Colors.black : Colors.white,
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

                          // Animated Custom Button Container
                          Transform.scale(
                            scale: 1.2,
                            child: CustomButton(onPressed: controller.Addi),
                          ),
                        ]),
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
              ),
            ),
          );
        });
  }
}
