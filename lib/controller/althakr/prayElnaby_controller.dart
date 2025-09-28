import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../main.dart';

abstract class PrayElnabyController extends GetxController {}

class PrayElnabyControllerImp extends PrayElnabyController {
  int i = 0;
  String counterName = "ادخل الذكر ";

  late TextEditingController textcontroll;

  @override
  void onInit() {
    textcontroll = TextEditingController();

    if (myBox!.get("iPrayElnaby") != null)
      i = myBox!.get("iPrayElnaby")!;

    if(myBox!.get("counterNamePrayElnaby")!= null)
      counterName = myBox!.get("counterNamePrayElnaby")!;

    super.onInit();
  }

  @override
  void dispose() {
    textcontroll.dispose();
    super.dispose();
  }

  void seti() {
    i = 0;
    myBox?.put("iPrayElnaby", 0);
    update();
  }

  void setCounter(String? val,BuildContext context) {
    counterName = val!;
    myBox?.put("counterNamePrayElnaby", counterName);
    textcontroll.clear();
    FocusScope.of(context).unfocus();
    update();
  }

  void Addi() {
    i++;
    myBox?.put("iPrayElnaby", i);
    update();
  }
  List<SelectedListItem> itemsDropdown = [
    SelectedListItem(
      name: "+",
    ),
    SelectedListItem(
      name:
      "اللَّهُمَّ ‌صَلِّ ‌عَلَى ‌مُحَمَّدٍ ‌وَعَلَى ‌آلِ ‌مُحَمَّدٍ، ‌كما ‌صليت ‌على ‌إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",
    ),
    SelectedListItem(
      name:
      "اللَّهُمَّ صَلِّ عَلَى سَيِّدِنَا مُحَمَّدٍ النَّبِيِّ الْأُمِّيِّ، وَعَلَى آلِهِ وَسَلِّمْ تَسْلِيمًا",
    ),
    SelectedListItem(
      name:
      "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَأَزْوَاجِهِ وَذُرِّيَّتِهِ، كَمَا صَلَّيْتَ عَلَى آلِ إِبْرَاهِيمَ، وَبَارِكْ عَلَى مُحَمَّدٍ وَأَزْوَاجِهِ وَذُرِّيَّتِهِ، كَمَا بَارَكْتَ عَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ",
    ),
    SelectedListItem(
      name:
      "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِهِ فِي الْأَوَّلِينَ، وَصَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِهِ فِي الْآخِرِينَ، وَصَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِهِ فِي الْمَلَإِ الْأَعْلَى إِلَى يَوْمِ الدِّينِ",
    ),
  ];

}
