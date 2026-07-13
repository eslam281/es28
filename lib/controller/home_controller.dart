import 'dart:ui';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/home/althakr/athkar.dart';
import '../view/screen/home/counter.dart';
import '../view/screen/home/times.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  int index = 2;
  late PageController pageController ;
  List<Widget> bodyList = [const Counter(), const Times(), const Althakr()];

  @override
  void onInit() {
    pageController = PageController(initialPage: 2);
    super.onInit();
  }
  @override
  void onReady() async {
    showDialog();
    super.onReady();
  }

  void setIndex(val) {
    index = val;
    update();
  }

  void onBottomNavTap(int val) {
    index = val;
    pageController.jumpToPage(index);
    update();
  }

  showDialog() async {
    Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: "",
      content: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.black.withAlpha(150) : Colors.white.withAlpha(200),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: AppColor.secondColor.withAlpha(50), width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.secondColor.withAlpha(30),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.auto_awesome_rounded, color: AppColor.secondColor, size: 40),
                ),
                const SizedBox(height: 20),
                const Text(
                  "هل صليت على النبي اليوم؟",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "اللَّهُمَّ ‌صَلِّ ‌عَلَى ‌مُحَمَّدٍ ‌وَعَلَى ‌آلِ ‌مُحَمَّدٍ، ‌كما ‌صليت ‌على ‌إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15, color: Colors.grey, height: 1.6),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.secondColor, AppColor.secondColor.withBlue(150)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.secondColor.withAlpha(100),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "حسناً",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
