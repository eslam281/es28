import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/elathaker_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../component/athkar/customAthkarCard.dart';

class AthkarSM extends StatelessWidget {
  const AthkarSM({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return  Scaffold(
      backgroundColor:AppColor.black,
      appBar:AppBar(actions:[MaterialButton(onPressed:() => controller.customRefresh(),
      child:const Icon(Icons.refresh,color:AppColor.secondColor),)],),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: ListView.builder(itemCount:  controller.adhkar.length,
            itemBuilder:(context, index) =>

            GetBuilder<ElathakerController>(
              builder: (controller) {
                if(controller.count[index] != controller.adhkar[index][1])
                return CustomAthkarCard(
                  elthakr:controller.adhkar[index][0] ,
                  count:controller.count[index] ,
                  max:controller.adhkar[index][1] ,
                  onTap:() =>controller.onTap(controller.adhkar[index][1], index),
                );
                return const SizedBox();
              }
            ),),
      ),
    );
  }
}
