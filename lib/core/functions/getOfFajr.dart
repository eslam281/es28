
import '../../main.dart';
import 'initBox.dart';

Future<DateTime> getDataOfFajr()async{
  myBox = await initalBox("times");
  DateTime now = DateTime.now();
  String fajrTime =myBox?.get("time")["Fajr"]?? "";
  List<String> parts = fajrTime.split(":");
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  DateTime nextFajr = DateTime(now.year, now.month, now.day + 1, hour, minute,);
  return nextFajr;
}