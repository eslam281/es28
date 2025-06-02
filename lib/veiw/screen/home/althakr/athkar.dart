import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Althakr extends StatelessWidget {
  const Althakr({super.key});

  @override
  Widget build(BuildContext context) {
   return Center(
     child: Column(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: [
          MaterialButton(onPressed:() =>Get.toNamed(AppRoute.athkar_SM),
            child:Card(
              color: AppColor.secondColor,
              child:Container(
                width: 200,height:100,alignment:Alignment.center,
                child: const Text("اذكار الصباح والمساء"
                ,style:TextStyle(color:AppColor.white,fontSize: 20,fontWeight:FontWeight.bold),),
              ) ,) ,),

          MaterialButton(onPressed:() =>Get.toNamed(AppRoute.athkar_SM),
            child:Card(
              color: AppColor.secondColor,
              child:Container(
                width: 200,height:100,alignment:Alignment.center,
                child: const Text("اذكار الصباح والمساء"
                ,style:TextStyle(color:AppColor.white,fontSize: 20,fontWeight:FontWeight.bold),),
              ) ,) ,),

          MaterialButton(onPressed:() =>Get.toNamed(AppRoute.athkarFriday),
            child:Card(
              color: AppColor.secondColor,
              child:Container(
                width: 200,height:100,alignment:Alignment.center,
                child: const Text( "اذكار يوم الجمعة"
                ,style:TextStyle(color:AppColor.white,fontSize: 20,fontWeight:FontWeight.bold),),
              ) ,) ,),
       ],
     ),
   );
  }
}
