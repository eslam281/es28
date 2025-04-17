import 'package:intl/intl.dart';

String convertF (String val){
  late String time24;
  late String time12;
  late DateTime dateTime;
  time24 = val;
  dateTime =DateFormat("HH:mm").parse(time24);
  time12 = DateFormat("h:mm").format(dateTime);
  return time12;
}