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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: ListView.builder(itemCount:  controller.adhkar.length,
            itemBuilder:(context, index) =>
            Column(
              children: [
                Container(
                  width:60,
                  decoration:const BoxDecoration(
                      borderRadius:BorderRadius.only(topLeft:Radius.circular(20))
                  ,color: AppColor.primaryColor),
                  alignment:Alignment.center,
                  child:Text(" / ${controller.adhkar[index][1]}",style:
                    const TextStyle(fontSize:20,color:AppColor.white),),
                ),
                Card(
                  color: AppColor.primaryColor,margin: EdgeInsets.zero,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(controller.adhkar[index][0],style:const
                    TextStyle(fontSize: 20,color: AppColor.white),
                      textDirection:TextDirection.rtl,),
                  ),),
                const SizedBox(height: 20,)
              ],
            ),),
      ),
    );
  }
}
