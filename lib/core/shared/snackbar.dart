import 'package:flutter/material.dart';
import 'package:get/get.dart';

CustomSnackBar(String title,String message) {
  return Get.snackbar("", "",
      titleText: Text(title, textDirection: TextDirection.rtl,textAlign:TextAlign.center,),
      messageText: Text(message, textDirection: TextDirection.rtl,),
      backgroundColor: Colors.white);
}
