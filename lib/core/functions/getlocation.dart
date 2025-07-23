import 'package:es28/core/shared/snackbar.dart';
import 'package:geolocator/geolocator.dart';

Future determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
    CustomSnackBar("تحذير","تم رفض أذونات الموقع");
    return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    CustomSnackBar("تحذير","تم رفض أذونات الموقع بشكل دائم، ولا يمكننا طلب الأذونات.");
    return null;
  }

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {

    CustomSnackBar("تحذير", "خدمات الموقع غير مفعلة.");

    while (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      await Future.delayed(const Duration(seconds: 6));
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
    }

  }

  return await Geolocator.getCurrentPosition(locationSettings:const
  LocationSettings(accuracy:LocationAccuracy.bestForNavigation));
}