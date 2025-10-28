import 'dart:math';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String image = AppImageAsset.logo;
  late int hour;
  late int index;
  @override
  void initState() {
    hour = DateTime.now().hour;
    final random = Random();
    index = random.nextInt(2);
    if (hour >= 3 && hour <= 6) {
      image = AppImageAsset.dawn;

    } else  if (hour >= 6 && hour <= 7) {
      image = index ==0? AppImageAsset.sunrise:AppImageAsset.sunrise2;

    } else  if (hour >= 8 && hour <= 13) {
      image = index ==0? AppImageAsset.morning:AppImageAsset.morning2;

    } else if (hour >= 14 && hour <= 18) {
      image =index ==0? AppImageAsset.evening :AppImageAsset.evening2;
    } else {
      image =index ==0? AppImageAsset.night : AppImageAsset.night2;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:context.isDarkMode? AppColor.black:AppColor.white,
      splashIconSize: double.infinity,
      splashTransition:SplashTransition.scaleTransition ,
        splash:Image.asset(image,fit:BoxFit.fill,) ,
        nextScreen: HomePage(),
      duration: 2000,curve: Curves.easeInToLinear ,
    );
  }
}
