import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class AthkarAP extends StatelessWidget {
  const AthkarAP({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:AppColor.black,
      appBar:AppBar(toolbarHeight:30,),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Image.asset(AppImageAsset.athkar_AP,fit:BoxFit.fill,height:Get.size.height-80,),
          ),
        ],
      ),
    );
  }
}
