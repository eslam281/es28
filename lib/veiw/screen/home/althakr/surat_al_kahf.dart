import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../controller/drawer/surat_al_kahf_controller.dart';
import '../../../../core/constant/color.dart';

class Surat_Al_Kahf extends StatelessWidget {
  const Surat_Al_Kahf({super.key});

  @override
  Widget build(BuildContext context) {
    SuratAlKahfController controller = Get.put(SuratAlKahfController());
    return Scaffold(
      appBar:AppBar(
        iconTheme:const IconThemeData(color:AppColor.white),toolbarHeight: 35,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          surfaceTintColor:const Color(0xFF5E4840)),
      body:Container(
        child:ListView.builder(itemCount:controller.images.length,
            itemBuilder: (context, index) =>
                Center(
                  child: Image.asset(controller.images[index],
                     fit:BoxFit.fitWidth,),
                )
          ,),
      ),
    );
  }
}
