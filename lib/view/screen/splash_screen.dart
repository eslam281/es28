import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor:context.isDarkMode? AppColor.black:AppColor.white,
      splashIconSize:500,
      splashTransition:SplashTransition.scaleTransition ,
        splash:Image.asset(AppImageAsset.logo,) ,
        nextScreen: HomePage(),
      duration: 2000,curve: Curves.easeInToLinear ,
    );
  }
}
