import 'package:es28/veiw/screen/home/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../veiw/screen/home/althakr/athkar.dart';
import '../veiw/screen/home/times.dart';

abstract class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController{
  int index=0;
  PageController pageController=PageController();
  List<Widget> bodyList=[
    const Counter(),
    const Times(),
    const Althakr()
  ];

  @override
  void onReady()async {
    showDialog();
    await Permission.ignoreBatteryOptimizations.request();
    super.onReady();
  }

  void setIndex(val){
    index =val;
    update();
  }
  void onBottomNavTap(int val) {
    index = val;
    pageController.jumpToPage(index);

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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}