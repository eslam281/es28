import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/elathaker_controller.dart';
import '../../../../core/constant/color.dart';

class AthkarSM extends StatelessWidget {
  const AthkarSM({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return  Scaffold(
      backgroundColor:AppColor.black,
      appBar:AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30,),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(controller.adhkar.length, (index) =>
                    Column(
                      children: [
                        Card(
                          color: AppColor.primaryColor,
                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(controller.adhkar[index][0],style:const
                            TextStyle(fontSize: 20,color: AppColor.white),
                              textDirection:TextDirection.rtl,),
                          ),),
                        const SizedBox(height: 10,)
                      ],
                    ),)
              ],
            ),
            const SizedBox(height: 30,)
          ],),
      ),
    );
  }
}
