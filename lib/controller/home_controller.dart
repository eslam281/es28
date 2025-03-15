import 'package:es28/veiw/screen/home/counter.dart';
import 'package:es28/veiw/screen/home/setting.dart';
import 'package:get/get.dart';

import '../veiw/screen/home/times.dart';

abstract class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController{
  int index=0;
  List bodyList=[
    Counter(),
    Times(),
    // Setting(),
  ];


  void setIndex(val){
    index =val;
    update();
  }
}