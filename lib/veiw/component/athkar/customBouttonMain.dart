import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonMain extends StatelessWidget {
  final String name;
  final String pageName;
  const CustomButtonMain({super.key, required this.name, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed:() =>Get.toNamed(pageName),
      child:Card(
        color: AppColor.secondColor,
        child:Container(
          width: 220,height:100,alignment:Alignment.center,
          child:  Text(name
            ,style:const TextStyle(color:AppColor.white,fontSize: 23,
                fontWeight:FontWeight.bold),),
        )
        ,)
      ,);
  }
}
