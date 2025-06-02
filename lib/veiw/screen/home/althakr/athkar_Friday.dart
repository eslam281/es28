import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/constant/routes.dart';

class AthkarFriday extends StatelessWidget {
  const AthkarFriday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.black,
      appBar: AppBar(),
      body: Center(
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

        Container(
          margin:const EdgeInsets.symmetric(horizontal: 40),
          padding:const EdgeInsets.symmetric(vertical: 10),
          color:AppColor.secondColor,
          alignment: Alignment.center,
          child: InkWell(
            onTap:() {Get.toNamed(AppRoute.surat_Al_Kahf);},
            child: const Row(
              mainAxisAlignment:MainAxisAlignment.center,
                textDirection:TextDirection.rtl,
                children: [
                  Text("سورة الكهف",style:TextStyle(fontSize:25
                      ,fontWeight: FontWeight.bold,color:AppColor.white),),
                  SizedBox(width:40,),
                  Icon(Icons.menu_book_outlined,size: 40,),]

            ),
          ),
        ),
      ],
    ),),);
  }
}
