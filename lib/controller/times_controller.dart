import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{
  TimeData timeData = TimeData(Crud());
  bool result=false;
  TimingModel? data;
   StatusRequest statusRequest =StatusRequest.loading;

  late String time24;
  late String time12;
  late DateTime dateTime;

  @override
  void onInit() {
    times();
    super.onInit();
  }

  String convertF (String val){
    time24 = val;
    dateTime =DateFormat("HH:mm").parse(time24);
    time12 = DateFormat("h:mm").format(dateTime);
    return time12;
  }

   iscontnect()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)) return true ;
    else if(connectivityResult.contains(ConnectivityResult.mobile)) return true ;
    else return false;
  }

   getdata() async{
     statusRequest =StatusRequest.loading;
     update();
    var response =await timeData.getData("https://api.aladhan.com/v1/timingsByCity?city=tarqaya&country=EGY&method=5#");

    statusRequest =handlingData(response);
     if(statusRequest == StatusRequest.success){
      data=TimingModel.fromJson(response["data"]["timings"]);

      sharedpref?.setString("fajr", data!.fajr!);
      sharedpref?.setString("sunrise", data!.sunrise!);
      sharedpref?.setString("dhuhr", data!.dhuhr!);
      sharedpref?.setString("asr", data!.asr!);
      sharedpref?.setString("maghrib", data!.maghrib!);
      sharedpref?.setString("isha", data!.isha!);
      sharedpref?.setString("lastthird", data!.lastthird!);
     }else{
       getTimesOff();
     }

  }

  times()async{

    result = await iscontnect();

    if(result){
      await getdata();
    }else{
      getTimesOff();
    }
    statusRequest =StatusRequest.success;
    update();

  }

  getTimesOff(){
    if (sharedpref!.getString("fajr") != null)
    data = TimingModel(
        fajr: sharedpref!.getString("fajr")!,
        sunrise: sharedpref!.getString("sunrise")!,
        dhuhr: sharedpref!.getString("dhuhr")!,
        asr: sharedpref!.getString("asr")!,
        maghrib: sharedpref!.getString("maghrib")!,
        isha: sharedpref!.getString("isha")!,
        lastthird: sharedpref!.getString("lastthird")!
    );
  }
}
