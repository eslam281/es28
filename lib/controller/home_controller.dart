import 'package:es28/veiw/screen/home/counter.dart';
import 'package:get/get.dart';

import '../veiw/screen/home/althakr.dart';
import '../veiw/screen/home/times.dart';

abstract class HomeController extends GetxController{

}
class HomeControllerImp extends HomeController{
  int index=0;
  List bodyList=[
    Counter(),
    Times(),
    Althakr()
  ];


  void setIndex(val){
    index =val;
    update();
  }
}