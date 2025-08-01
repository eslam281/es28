import 'package:es28/veiw/screen/home/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/background_service.dart';
import '../veiw/screen/home/althakr/athkar.dart';
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
  void onReady() {
    // showBatteryOptimizationDialog();
     openBatteryOptimizationSettings();
    Future.delayed(const Duration(seconds: 5)).then(
          (value) => showDialog());

    super.onReady();
  }

  void setIndex(val){
    index =val;
    update();
  }
  showDialog()async{
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
       content: const Text("اللَّهُمَّ ‌صَلِّ ‌عَلَى ‌مُحَمَّدٍ ‌وَعَلَى ‌آلِ ‌مُحَمَّدٍ، ‌كما ‌صليت ‌على ‌إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد،"
           " اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",
       textDirection:TextDirection.rtl,style:TextStyle(fontSize:16),)
    );
  }
  void showBatteryOptimizationDialog() {
    Get.defaultDialog(
      title: "تشغيل في الخلفية",
      content: const Text(
        "لتفادي توقف الأذان أو الخدمات الخلفية، يُرجى استثناء التطبيق من تحسينات البطارية.",
        textDirection: TextDirection.rtl,
        style: TextStyle(fontSize: 16),
      ),
      confirm: Container(
        margin: const EdgeInsets.only(right: 10),
        child: MaterialButton(
          onPressed: () {
            Get.back(); // إغلاق الديالوج أولًا
            openBatteryOptimizationSettings(); // ثم فتح الإعدادات
          },
          color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const Text(
            "افتح الإعدادات",
            style: TextStyle(fontSize: 17, fontFamily: "sans", color: Colors.white),
          ),
        ),
      ),
      cancel: Container(
        margin: const EdgeInsets.only(left: 10),
        child: MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const Text(
            "لاحقًا",
            style: TextStyle(fontSize: 17, fontFamily: "sans"),
          ),
        ),
      ),
    );
  }

}