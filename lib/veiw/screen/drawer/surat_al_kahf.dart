import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/drawer/surat_al_kahf_controller.dart';

class Surat_Al_Kahf extends StatelessWidget {
  const Surat_Al_Kahf({super.key});

  @override
  Widget build(BuildContext context) {
    SuratAlKahfController controller = Get.put(SuratAlKahfController());
    return Scaffold(
      body:Container(
        padding:const EdgeInsets.all(15),
        child:ListView.builder(itemCount:controller.images.length,
            itemBuilder: (context, index) =>
                Center(
                  child: Image.asset(controller.images[index]),
                )
          ,),
      ),
    );
  }
}
