
import 'package:get/get.dart';

import '../../core/class/prayerTimePoint.dart';
import '../../core/functions/StringToTime.dart';
import '../../core/shared/snackbar.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';

class PrayingStatsController extends GetxController{

  List<TimingModel>? timings;
  List<String> timeName =[
    "الفجر",
    "الظهر",
    "العصر",
    "المغرب",
    "العشاء"
  ];
  String? dateResponse;

  @override
  void onInit() {

    if(myBox?.get("timefor30") != null &&
        myBox?.get("timesMonth")==DateTime.now().month.toString()){
      getTimesOff();
    }
    super.onInit();
  }
  onReady(){
    if(myBox?.get("timefor30") == null ||
        myBox?.get("timesMonth")!=DateTime.now().month.toString()){
      CustomSnackBar("خطأ","يرجى تنزيل أوقات الصلاة أولاً من صفحة الأوقات.");
    }
  }

  getTimesOff(){
    List? dataList;

     dataList = myBox?.get("timefor30");
    timings = dataList?.map<TimingModel>((e) => TimingModel.fromJson(e["timings"])).toList();
    dateResponse =myBox?.get("timesMonth")??"";
  }
  List<PrayerTimePoint> listDataSource(time){
    List<PrayerTimePoint> dataList = [];

    for (int i = 0; i < timings!.length; i++) {
      List Times =[
        timings?[i].fajr,
        timings?[i].dhuhr,
        timings?[i].asr,
        timings?[i].maghrib,
        timings?[i].isha,
      ];
      dataList.add(
      PrayerTimePoint(i+ 1, convertTimeToMinutes(Times[time]),)
      );
    }
    return dataList;
  }
}