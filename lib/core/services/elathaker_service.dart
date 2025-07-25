import 'package:intl/intl.dart';

import '../../main.dart';

Future<void> elathakerService() async {
  List count=[];
  count.length = 20;
  count.fillRange(0, 20, 0);
  if (myBox?.get("time") != null) {
    if (!checkDate('Asr') && checkDate('Fajr') && myBox?.get("athakertime") == 1) {

      myBox?.put("athakerCount", count);
      myBox?.put("athakertime", 2);
    } else if (checkDate('Asr') && myBox?.get("athakertime") == 2) {

      myBox?.put("athakerCount", count);
      myBox?.put("athakertime", 1);
    } else {
      elseCond(count);
    }
  } else {
    elseCond(count);
  }
}

void elseCond(count) {

  if (checkDate('Asr')) {
    myBox?.put("athakertime", 2);
  } else {
    myBox?.put("athakertime", 1);
  }
}

bool checkDate(String name) {
  if (myBox?.get("time") != null) {
    final String time = myBox?.get("time")[name] ?? "";
    final String currentTime = DateFormat('HH:mm').format(DateTime.now());

    return currentTime.compareTo(time) > 0;
  }
  return false;
}