import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../main.dart';

abstract class CountController extends GetxController {}

class CountControllerImp extends CountController {
  int i = 0;
  String counterName = "ادخل الذكر ";

  late TextEditingController textcontroll;

  List<SelectedListItem<String>> itemsDropdown = [];
  final List<String> defaultAthkar = [
    "أَسْـتَغْفِرُ الله",
    "سبحان الله",
    "الحمد الله",
    "الله اكبر",
    "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير",
    "اللَّهُمَّ ‌صَلِّ ‌عَلَى ‌مُحَمَّدٍ ‌وَعَلَى ‌آلِ ‌مُحَمَّدٍ، ‌كما ‌صليت ‌على ‌إبراهيم، وعلى آل إبراهيم، إنك حميد مجيد، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كما باركت على إبراهيم وعلى آل إبراهيم، إنك حميد مجيد",
  ];

  @override
  void onInit() {
    textcontroll = TextEditingController();

    if (myBox!.get("i") != null) i = myBox!.get("i")!;

    if (myBox!.get("counterName") != null)
      counterName = myBox!.get("counterName")!;

    _buildDropdownItems();

    super.onInit();
  }

  void _buildDropdownItems() {
    List<String> customList =
        List<String>.from(myBox?.get("customAthkarList") ?? []);

    itemsDropdown = [
      SelectedListItem<String>(data: "+"),
      ...defaultAthkar.map((e) => SelectedListItem<String>(data: e)),
      ...customList.map((e) => SelectedListItem<String>(data: e)),
    ];
  }

  void addCustomThikr(String thikr) async {
    if (thikr.isEmpty || thikr == "+" || defaultAthkar.contains(thikr)) return;

    List<String> customList =
        List<String>.from(myBox?.get("customAthkarList") ?? []);

    if (!customList.contains(thikr)) {
      customList.add(thikr);
      await myBox?.put("customAthkarList", customList);
      _buildDropdownItems();
      update();
    }
  }

  void deleteCustomThikr(String thikr) async {
    if (defaultAthkar.contains(thikr) || thikr == "+") return;

    List<String> customList =
        List<String>.from(myBox?.get("customAthkarList") ?? []);

    if (customList.contains(thikr)) {
      customList.remove(thikr);
      await myBox?.put("customAthkarList", customList);
      _buildDropdownItems();
      update();
    }
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

  void setCounter(String? val, BuildContext context) {
    if (val == null || val.trim().isEmpty) return;
    counterName = val;
    myBox?.put("counterName", counterName);

    // Save if it's a new custom thikr
    addCustomThikr(val);

    textcontroll.clear();
    FocusScope.of(context).unfocus();
    update();
  }

  void Addi() {
    i++;
    myBox?.put("i", i);
    update();
  }
}
