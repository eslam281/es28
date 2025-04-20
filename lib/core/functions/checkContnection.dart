import 'package:connectivity_plus/connectivity_plus.dart';

import '../shared/snackbar.dart';

iscontnect()async{
  final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
  if(connectivityResult.contains(ConnectivityResult.wifi)) return true ;
  else if(connectivityResult.contains(ConnectivityResult.mobile)) return true ;
  else {
    CustomSnackBar("تنببه","انت الان في حاله عدم الاتصال يرجى  \nالاتصال بالانترنت واعاده المحاوله");
    return false;
  }
}