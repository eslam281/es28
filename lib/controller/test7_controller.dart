import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class Modle extends GetxController {
  int i = 0;
  int index=0;
  bool status=true;
  String counter="ادخل الذكر ";
  void Subi (){
    if(i<=0)return;
    i--;
    sharedpref?.setInt("i", i);
    update();
  }
  void Addi (){
    i++;
    sharedpref?.setInt("i", i);
    update();
  }
  void seti (int? val){
    i=val!;
    sharedpref?.setInt("i", i);
    update();
  }
  void setCounter (String? val){
    counter=val!;
    sharedpref?.setString("counter", counter);
    update();
  }
  void setStatus (bool val){
    status=val;
    update();
  }

}
class GetModle extends GetxController{
  bool  isLoading =true;
  bool result=false;
  Map data= {};
  late String Fajr;
  late String Sunrise;
  late String Dhuhr;
  late String Asr;
  late String Maghrib;
  late String Isha;
  late String time24;
  late String time12;
  late DateTime dateTime;
  String convertF (String val){
    time24 = val;
    dateTime =DateFormat("HH:mm").parse(time24);
    time12 = DateFormat("h:mm").format(dateTime);
    return time12;
  }
  Future iscontnect()async{
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)) result =true ;
    else if(connectivityResult.contains(ConnectivityResult.mobile)) result =true ;
    if(result){
      await getdata();
      isLoading=false;}
  }
  Future getdata() async{
    var response =await get(Uri.parse("https://api.aladhan.com/v1/timingsByCity?city=tarqaya&country=EGY&method=5#"));
    var responsebody =jsonDecode(response.body);
    data.addAll(responsebody);
    settimes ();
    return ;
  }
  settimes (){
    Asr= convertF(data["data"]["timings"]["Asr"]);
    Maghrib= convertF(data["data"]["timings"]["Maghrib"]);
    Isha= convertF(data["data"]["timings"]["Isha"]);
    Fajr= data["data"]["timings"]["Fajr"];
    Sunrise= data["data"]["timings"]["Sunrise"];
    Dhuhr= data["data"]["timings"]["Dhuhr"];
  }
}
