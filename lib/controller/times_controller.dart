import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:es28/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:intl/intl.dart';

import '../modle/modle.dart';

class TimesController extends GetxController{
  bool  isLoading =true;
  bool result=false;
  TimingModel? data;

  late String time24;
  late String time12;
  late DateTime dateTime;

  @override
  void onInit() {
    iscontnect();
    super.onInit();
  }

  // String convertF (String val){
  //   time24 = val;
  //   dateTime =DateFormat("HH:mm").parse(time24);
  //   time12 = DateFormat("h:mm").format(dateTime);
  //   return time12;
  // }
  Future iscontnect()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)) result =true ;
    else if(connectivityResult.contains(ConnectivityResult.mobile)) result =true ;

    if(result){
      await getdata();
      sharedpref?.setString("fajr", data!.fajr);
      sharedpref?.setString("sunrise", data!.sunrise);
      sharedpref?.setString("dhuhr", data!.dhuhr);
      sharedpref?.setString("asr", data!.asr);
      sharedpref?.setString("maghrib", data!.maghrib);
      sharedpref?.setString("isha", data!.isha);
      sharedpref?.setString("lastthird", data!.lastthird);
    }else if (sharedpref!.getString("fajr") != null) {

      data =TimingModel(
          fajr: sharedpref!.getString("fajr")!,
          sunrise: sharedpref!.getString("sunrise")!,
          dhuhr: sharedpref!.getString("dhuhr")!,
          asr: sharedpref!.getString("asr")!,
          maghrib: sharedpref!.getString("maghrib")!,
          isha: sharedpref!.getString("isha")!,
          lastthird: sharedpref!.getString("lastthird")!
      );
    }

    isLoading=false;
    update();
  }

  Future getdata() async{
    var response =await get(Uri.parse("https://api.aladhan.com/v1/timingsByCity?city=tarqaya&country=EGY&method=5#"));
    var responsebody =jsonDecode(response.body);
    data=TimingModel.fromJson(responsebody["data"]["timings"]);
    // settimes ();
  }

  // settimes (){
  //   Asr= convertF(data["data"]["timings"]["Asr"]);
  //   Maghrib= convertF(data["data"]["timings"]["Maghrib"]);
  //   Isha= convertF(data["data"]["timings"]["Isha"]);
  //   Fajr= data["data"]["timings"]["Fajr"];
  //   Sunrise= data["data"]["timings"]["Sunrise"];
  //   Dhuhr= data["data"]["timings"]["Dhuhr"];
  // }
}
