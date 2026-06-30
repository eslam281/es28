import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../controller/count_controller.dart';

class CustomFloatingActionButton extends GetView<CountControllerImp> {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
