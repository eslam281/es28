import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:es28/veiw/screen/home.dart';
import 'package:flutter/cupertino.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize:500,
      splashTransition:SplashTransition.scaleTransition ,
        splash:Image.asset(AppImageAsset.logo,) ,
        nextScreen: HomePage(),
      duration: 2000,curve: Curves.easeInToLinear ,
    );
  }
}
