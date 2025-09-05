import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/sittings_controller.dart';
import '../../../core/constant/color.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SittingsControllerImp controller = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50,),
          GestureDetector(
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColor.secondColor, shape: BoxShape.circle),
                padding: const EdgeInsets.all(30),
                child: context.isDarkMode ? const Icon(Icons.light_mode)
                    : const Icon(Icons.dark_mode),
              ),
              onTap: () {
                controller.changeThemeMode();
              }),
        ],),
    );
  }
}
