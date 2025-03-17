import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExitApp(){

  return Get.defaultDialog(
    title:"تنبيه",middleText:"هل تريد الخروج من التطبيق",
    confirm: Container(
      margin:const EdgeInsets.only(left: 10),
      child: MaterialButton(onPressed: (){
        exit(0);
      },color:Colors.red,
          shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
          child: const Text("خروج",style:TextStyle(fontSize: 17,fontFamily:"sans"),) ),
    ),

    cancel:Container(
      margin:const EdgeInsets.only(right: 10),
      child: MaterialButton(onPressed: (){
        Get.back();
      },color:Colors.green
        ,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
        child: const Text("إلغاء",style:TextStyle(fontSize: 17,fontFamily:"sans")),),
    ),
  );
}