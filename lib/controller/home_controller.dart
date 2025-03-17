import 'package:es28/veiw/screen/home/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../veiw/screen/home/althakr.dart';
import '../veiw/screen/home/times.dart';

abstract class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController{
  int index=0;
  List bodyList=[
    const Counter(),
    const Times(),
    const Althakr()
  ];

  @override
  void onInit() {
    showDialog();
    super.onInit();
  }

  void setIndex(val){
    index =val;
    update();
  }
  showDialog()async{
   await Future.delayed(const Duration(seconds: 3));
     Get.defaultDialog(
         confirm:Container(
           margin:const EdgeInsets.only(right: 10),
           child: MaterialButton(onPressed: (){
             Get.back();
           },color:Colors.green
             ,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
             child: const Text("حسنا",style:TextStyle(fontSize: 17,fontFamily:"sans")),),
         ),
        title:"هل صليت على النبي اليوم ؟ ",
       content: const Text("")
    );
  }
}