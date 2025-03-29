import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:es28/core/class/crud.dart';
import 'package:es28/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


import '../core/class/statusrequest.dart';
import '../core/functions/handlingdata.dart';
import '../data/datasource/time_data.dart';
import '../data/modle/modle.dart';


class TimesController extends GetxController{

  late String timingUrl;
  TimeData timeData = TimeData(Crud());
  bool result=false;
  TimingModel? data;
  StatusRequest statusRequest =StatusRequest.loading;
  late Position position;

  late String time24;
  late String time12;
  late DateTime dateTime;
  String? date;

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
    if(timingUrl != null) {
      var response = await timeData.getData(timingUrl);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        data = TimingModel.fromJson(response["data"]["timings"]);
        date = response["data"]["date"]["gregorian"]["date"];
        print(date);

        sharedpref?.setString("fajr", data!.fajr!);
        sharedpref?.setString("sunrise", data!.sunrise!);
        sharedpref?.setString("dhuhr", data!.dhuhr!);
        sharedpref?.setString("asr", data!.asr!);
        sharedpref?.setString("maghrib", data!.maghrib!);
        sharedpref?.setString("isha", data!.isha!);
        sharedpref?.setString("lastthird", data!.lastthird!);
        sharedpref?.setString("date", date!);
      } else {
        getTimesOff();
      }
    }
    print(timingUrl);
  }

  times()async{

    result = await iscontnect();

    if(result){
      await reverseGeocode();
      await getdata();
    }else{
      getTimesOff();
    }
    statusRequest =StatusRequest.success;
    update();

  }

  getTimesOff(){
    if (sharedpref!.getString("fajr") != null){
      data = TimingModel(
          fajr: sharedpref!.getString("fajr")!,
          sunrise: sharedpref!.getString("sunrise")!,
          dhuhr: sharedpref!.getString("dhuhr")!,
          asr: sharedpref!.getString("asr")!,
          maghrib: sharedpref!.getString("maghrib")!,
          isha: sharedpref!.getString("isha")!,
          lastthird: sharedpref!.getString("lastthird")!
      );
      date =sharedpref!.getString("date");
    }

  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;


    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    while (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      // if (permission == LocationPermission.denied) {
      //   // Permissions are denied, next time you could try
      //   // requesting permissions again (this is also where
      //   // Android's shouldShowRequestPermissionRationale
      //   // returned true. According to Android guidelines
      //   // your App should show an explanatory UI now.
      //   return Future.error('Location permissions are denied');
      // }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> reverseGeocode() async {
    position = await _determinePosition();
    final String
    url = "https://nominatim.openstreetmap.org/reverse?lat=${position.latitude}&lon=${position.longitude}"
        "&format=json&accept-language=en";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        print(data["address"]);
        timingUrl = "https://api.aladhan.com/v1/timingsByCity?city=${data["address"]["road"]??data["address"]["state"]}&"
            "country=${data["address"]["country"]}&method=5#";
      } else {
        print("Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

}
