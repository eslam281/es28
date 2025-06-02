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
       mainAxisAlignment:MainAxisAlignment.center,
       children: [
          MaterialButton(onPressed:() =>Get.toNamed(AppRoute.athkar_SM),
            minWidth: 400,
            child:const Card(
              color: AppColor.secondColor,
              child:Text("اذكار الصباح والمساء"
              ,style:TextStyle(color:AppColor.white),) ,) ,)
       ],
     ),
   );
  }
}
