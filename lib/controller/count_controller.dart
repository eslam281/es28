import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';

abstract class CountController extends GetxController {}

class CountControllerImp extends CountController {
  int i = 0;
  String counter = "ادخل الذكر ";

  late TextEditingController textcontroll;

  @override
  void onInit() {
    textcontroll = TextEditingController();

    if (myBox!.get("i") != null)
      i = myBox!.get("i")!;

    if(myBox!.get("counter")!= null)
      counter = myBox!.get("counter")!;

    super.onInit();
  }

  @override
  void dispose() {
    textcontroll.dispose();
    super.dispose();
  }

  void seti() {
    i = 0;
    myBox?.put("i", 0);
    update();
  }

  void setCounter(String? val,BuildContext context) {
    counter = val!;
    myBox?.put("counter", counter);
    textcontroll.clear();
    FocusScope.of(context).unfocus();
    update();
  }

  void Addi() {
    i++;
    myBox?.put("i", i);
    update();
  }
  List<SelectedListItem> itemsDropdown = [
    SelectedListItem(name: "+",),
    SelectedListItem(name: "أَسْـتَغْفِرُ الله",),
    SelectedListItem(name: "سبحان الله"),
    SelectedListItem(name: "الحمد الله"),
    SelectedListItem(name: "الله اكبر",),
    SelectedListItem(name: "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير",),
    SelectedListItem(name: "اللَّهُمَّ ‌صَلِّ ‌عَلَى ‌مُحَمَّدٍ ‌وَعَلَى ‌آلِ ‌مُحَمَّدٍ، ‌كما ‌صليت ‌على ‌إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",),
  ];
}
