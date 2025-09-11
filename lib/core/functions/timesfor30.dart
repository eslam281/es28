import 'package:intl/intl.dart';

import '../../data/datasource/time_data.dart';
import '../../main.dart';
import '../class/crud.dart';
import '../class/statusrequest.dart';
import '../constant/apiLink.dart';
import 'checkContnection.dart';
import 'getNameOfLocation.dart';
import 'handlingdata.dart';

class Timesfor30{

  static timesfor30(bool isready)async{
    StatusRequest statusRequest =StatusRequest.onitnial;
    bool isondate =await checkDate();

    if(!isondate||isready){
      bool result = false;
      result = await iscontnect();

      if (result) {
        statusRequest = await getdata();
      }else{
        statusRequest =StatusRequest.offlinefailure;
      }
    }
    return statusRequest;

  }

 static Future<StatusRequest> getdata() async {
    StatusRequest statusRequest = StatusRequest.onitnial;
    TimeData timeData = TimeData(Crud());
    List? data;
    String? dateResponse;
    late String timingUrl;

    if (await myBox?.get("location") !=null) {
      List locationList = await myBox?.get("location");
      timingUrl = "${ApiLink.timesApi30}country=${locationList[0]}"
          "&city=${locationList[1]}&method=5#";
    } else {
      timingUrl = await reverseGeocode();
    }
    if (timingUrl == "") {
      timingUrl = "${ApiLink.timesApi30}country=Egypt&city=cairo&method=5#";
      statusRequest = StatusRequest.error;
    }

    var response = await timeData.getData(timingUrl);

    statusRequest = await handlingData(response);
    if (statusRequest == StatusRequest.success) {
      data = response["data"];
      dateResponse = response["data"][0]["date"]["gregorian"]["month"]["number"].toString();
      myBox?.put("timefor30", data!);
      myBox?.put("timesMonth", dateResponse);
    }
    return statusRequest;
  }

 static Future<bool> checkDate() async {
    String? dateResponse = await myBox?.get("timesMonth") ?? "";
    return dateResponse == DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}
