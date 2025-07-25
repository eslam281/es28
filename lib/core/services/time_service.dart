import 'package:intl/intl.dart';

import '../../data/datasource/time_data.dart';
import '../../data/modle/modle.dart';
import '../../main.dart';
import '../class/crud.dart';
import '../class/statusrequest.dart';
import '../functions/checkContnection.dart';
import '../functions/getNameOfLocation.dart';
import '../functions/handlingdata.dart';


Future<StatusRequest> times(bool isready,bool isBackground)async{
  StatusRequest statusRequest =StatusRequest.onitnial;
  bool isondate =await checkDate();

  if(!isondate||isready){
    bool result = false;
    result = await iscontnect();

    if (result) {
      statusRequest = await getdata(isBackground);
    }else{
      statusRequest =StatusRequest.offlinefailure;
    }
  }
  return statusRequest;
}

Future<StatusRequest> getdata(bool isBackground) async{
  StatusRequest statusRequest =StatusRequest.onitnial;
  TimeData timeData = TimeData(Crud());
  TimingModel? data;
  String? dateResponse;
  late String timingUrl;

  if(isBackground){
    List locationList = await myBox?.get("location")??["Egypt","Cairo"];
    timingUrl ="https://api.aladhan.com/v1/timingsByCity?country=${locationList[0]}"
        "&city=${locationList[1]}&method=5#";
  }
  else{
    timingUrl= await reverseGeocode();
  }
  if (timingUrl == ""){
    timingUrl ="https://api.aladhan.com/v1/timingsByCity?country=Egypt&city=cairo&method=5#";
    statusRequest = StatusRequest.error;
  }

  var response = await timeData.getData(timingUrl);

  statusRequest = await handlingData(response);
  if (statusRequest == StatusRequest.success) {
    data = TimingModel.fromJson(response["data"]["timings"]);
    dateResponse = response["data"]["date"]["gregorian"]["date"];

    myBox?.put("time",data.toJson());
    myBox?.put("date",dateResponse);
  }
  return statusRequest;
}


Future<bool> checkDate()async{
  String? dateResponse;
  dateResponse =await myBox?.get("date")??"";
  return dateResponse==DateFormat('dd-MM-yyyy').format(DateTime.now());
}
