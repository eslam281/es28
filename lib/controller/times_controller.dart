import 'dart:async';
import 'dart:math';

import 'package:es28/core/class/crud.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:es28/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../core/class/statusrequest.dart';

import '../core/functions/timesfor30.dart';
import '../core/shared/snackbar.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController {
  StatusRequest statusRequest = StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;

  bool isready = false;
  late Timer rebuild;
  List locationList = myBox?.get("location") ?? ["", "Cairo"];

  String? dateResponse;

  // Countdown related
  Timer? countdownTimer;
  String nextPrayerName = "";
  Duration timeToNextPrayer = Duration.zero;

  // Background Image management
  String currentBackgroundImage = "";
  int _bgChangeSecondsCounter = 0;

  @override
  void onInit() async {
    _updateBackgroundImage(); // Set atmospheric background immediately
    if (myBox?.get("timefor30") == null ||
        myBox?.get("timesMonth") != DateTime.now().month.toString()) {
      await gettimes();
    } else {
      getTimesOff();
    }
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        isready = true;
        update();
      },
    );
    _startCountdown();
    super.onInit();
  }

  void _startCountdown() {
    countdownTimer?.cancel();
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateNextPrayer();
      
      // Update background every 15 seconds
      _bgChangeSecondsCounter++;
      if (_bgChangeSecondsCounter >= 15) {
        _updateBackgroundImage();
        _bgChangeSecondsCounter = 0;
      }
      
      update();
    });
  }

  void _updateBackgroundImage() {
    int hour = DateTime.now().hour;
    int index = Random().nextInt(2);

    if (hour >= 3 && hour <= 6) {
      currentBackgroundImage = AppImageAsset.dawn;
    } else if (hour >= 6 && hour <= 7) {
      currentBackgroundImage = AppImageAsset.sunrise[index];
    } else if (hour >= 8 && hour <= 13) {
      currentBackgroundImage = AppImageAsset.morning[index];
    } else if (hour >= 14 && hour <= 18) {
      currentBackgroundImage = AppImageAsset.evening[index];
    } else {
      currentBackgroundImage = AppImageAsset.night[index];
    }
  }

  void _calculateNextPrayer() {
    if (data == null) return;

    final now = DateTime.now();
    final Map<String, String> prayerTimes = {
      "الفجر": data!.fajr!,
      "الشروق": data!.sunrise!,
      "الظهر": data!.dhuhr!,
      "العصر": data!.asr!,
      "المغرب": data!.maghrib!,
      "العشاء": data!.isha!,
    };

    DateTime? nextTime;
    String? nextName;

    List<String> sortedNames = ["الفجر", "الشروق", "الظهر", "العصر", "المغرب", "العشاء"];

    for (var name in sortedNames) {
      final timeStr = prayerTimes[name]!;
      // Robust parsing: extract HH:mm even if there's extra text like (EEST)
      final cleanTime = RegExp(r"(\d{1,2}:\d{1,2})").firstMatch(timeStr)?.group(1) ?? timeStr;
      final parts = cleanTime.split(":");
      
      final prayerDateTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );

      if (prayerDateTime.isAfter(now)) {
        nextTime = prayerDateTime;
        nextName = name;
        break;
      }
    }

    if (nextTime == null) {
      // It's after Isha, next is Fajr tomorrow
      final timeStr = prayerTimes["الفجر"]!;
      final cleanTime = RegExp(r"(\d{1,2}:\d{1,2})").firstMatch(timeStr)?.group(1) ?? timeStr;
      final parts = cleanTime.split(":");
      
      nextTime = DateTime(
        now.year,
        now.month,
        now.day + 1,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
      nextName = "الفجر";
    }

    nextPrayerName = nextName!;
    timeToNextPrayer = nextTime.difference(now);
  }

  @override
  void onClose() {
    countdownTimer?.cancel();
    super.onClose();
  }

  getTimesOff() {
    List dataList = [];
    final int day = DateTime.now().day;
    final int nextDay = DateTime.now().add(const Duration(days: 1)).day;

    if (myBox?.get("timefor30") != null &&
        myBox?.get("timesMonth") == DateTime.now().month.toString()) {
      dataList = myBox?.get("timefor30");
      int index = day - 1;
      if (checkTime('Isha') && day < nextDay) {
        index = day;
      }
      data = TimingModel.fromJson(dataList[index]["timings"]);
      dateResponse = dataList[index]["date"]["gregorian"]["date"];
    }
    update();
  }

  reTimes()async{
    if(isready){
      await gettimes();
    }
    isready = false;
    update();
    CustomSnackBar("تنببه","انتظر حتى يتم اعاده تشغيل الزر بعد 40 ثانية");

    rebuild = Timer(const Duration(seconds: 40),() {
      isready =true;
      update();
    },);
  }

  gettimes()async{
    statusRequest =StatusRequest.loading;
    update();
    statusRequest = await Timesfor30.timesfor30(isready);

    if(statusRequest == StatusRequest.error){
      Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
          backgroundColor: Colors.white);
    }else if(statusRequest == StatusRequest.offlinefailure){
      CustomSnackBar("تنببه",
          "انت الان في حاله عدم الاتصال يرجى الاتصال بالانترنت واعاده المحاوله");
    }
    await getTimesOff();
    locationList = await myBox?.get("location")??["","Cairo"];
    statusRequest =StatusRequest.success;
    update();
  }
  bool checkTime(String name) {
    final int day = DateTime.now().day;
    final String time = myBox?.get("timefor30")[day-1]["timings"][name] ?? "";
    final String currentTime = DateFormat('HH:mm').format(DateTime.now());
    return currentTime.compareTo(time) > 0;
  }
}
/*

  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;

  bool isready = false;
  late Timer rebuild ;
  Position? position;
  List locationList =  myBox?.get("location")??["","Cairo"];

  String? dateResponse;

  @override
  void onInit() async{
    if(myBox?.get("time") == null){
      await gettimes();
    }else{
      getTimesOff();
    }
    Future.delayed(const Duration(seconds: 3)).then((value) {
      isready =true;
      update();
    },);
    // await initializeService();
    // FlutterBackgroundService().invoke("setAsBackground");
    super.onInit();
  }

  reTimes()async{

    if(isready){
     await gettimes();
    }
    isready = false;
    update();
    CustomSnackBar("تنببه","انتظر حتى يتم اعاده تشغيل الزر بعد 40 ثانية");

   rebuild = Timer(const Duration(seconds: 40),() {
     isready =true;
     update();
   },);
  }

  gettimes()async{
    statusRequest =StatusRequest.loading;
    update();
    statusRequest = await times(isready,false);

    if(statusRequest == StatusRequest.error){
      Get.snackbar("تحذير","أنت الآن في الموقع الافتراضي مصر",
          backgroundColor: Colors.white);
    }else if(statusRequest == StatusRequest.offlinefailure){
      CustomSnackBar("تنببه",
          "انت الان في حاله عدم الاتصال يرجى الاتصال بالانترنت واعاده المحاوله");
    }
    await getTimesOff();
    locationList = await myBox?.get("location")??["","Cairo"];
    statusRequest =StatusRequest.success;
    update();
  }

  getTimesOff(){
    if(myBox?.get("time") != null)
      data= TimingModel.fromJson(myBox?.get("time"));
      dateResponse =myBox?.get("date")??"";
  }
*/