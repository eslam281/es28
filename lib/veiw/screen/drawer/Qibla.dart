import 'dart:math' as math;

import 'package:es28/core/class/handlingdataview.dart';
import 'package:es28/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/Qibla_controller.dart';
import '../../../core/constant/color.dart';

class QiblaPage extends StatelessWidget {
  const QiblaPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(QiblaControllerImp());
    return Scaffold(
        appBar: AppBar(title: const Text('اتجاه القبلة')
          ,centerTitle: true,titleTextStyle:const TextStyle(color:AppColor.primaryColor,
          fontSize:25), backgroundColor:AppColor.black,
          iconTheme: const IconThemeData(color: AppColor.secondColor),),
      body: Stack(fit: StackFit.expand,
        children: [
          Container(color:AppColor.black,),

          GetBuilder<QiblaControllerImp>(builder: (controller) {
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

                    double angle = (controller.qiblaDirection - direction!) * (math.pi / 180);

                    return Center(
                        child: Transform.rotate(
                          angle: angle,
                          child: Container(
                            width:250,height:250,
                            decoration:BoxDecoration(borderRadius:BorderRadius.circular(150),
                                border:Border.all(),image:const DecorationImage(image:
                                AssetImage(AppImageAsset.qibla),
                                    fit:BoxFit.cover,isAntiAlias:true)),
                        ),
                      ),
                    );
                  },
                ));
          },),
        ],
      )


    );
  }
}
