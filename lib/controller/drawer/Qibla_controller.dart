import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/calculateQiblaDirection.dart';
import '../../core/functions/getlocation.dart';

abstract class QiblaController extends GetxController {

}

class QiblaControllerImp extends QiblaController {
  StatusRequest statusRequest = StatusRequest.loading;
  late double qiblaDirection;

  @override
  void onInit() {
    initQiblaDirection();
    super.onInit();
  }


  Future<void> initQiblaDirection() async {
    final Position? position = await determinePosition();
    if (position != null) {
      double bearing = calculateQiblaDirection(position.latitude, position.longitude);
        qiblaDirection = bearing;
        statusRequest = StatusRequest.success;

    }else{
      statusRequest = StatusRequest.failure;
    }
    update();
  }

}
