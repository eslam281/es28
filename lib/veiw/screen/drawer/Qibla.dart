import 'dart:math' as math;

import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';

import '../../../controller/Qibla_controller.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QiblaControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text('Qibla Compass')),
      body: GetBuilder<QiblaControllerImp>(builder: (controller) {
        return HandlingDataView(statusRequest: controller.statusRequest,
            widget: StreamBuilder<CompassEvent>(
              stream: FlutterCompass.events,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error reading compass'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                double? direction = snapshot.data?.heading;

                if (direction == null) {
                  return const Center(child: Text('Device does not have sensors.'));
                }

                double angle = (controller.qiblaDirection - direction) * (math.pi / 180);

                return Center(
                  child: Container(
                    alignment: Alignment.center,
                    child: Transform.rotate(
                      angle: angle,
                      child: Image.asset(AppImageAsset.qibla, width: 300, height: 300),
                    ),
                  ),
                );
              },
            ));
      },)


    );
  }
}
