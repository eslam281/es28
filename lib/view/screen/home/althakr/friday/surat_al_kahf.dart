import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../controller/althakr/surat_al_kahf_controller.dart';
import '../../../../../core/constant/color.dart';

class Surat_Al_Kahf extends StatelessWidget {
  const Surat_Al_Kahf({super.key});

  @override
  Widget build(BuildContext context) {
    SuratAlKahfController controller = Get.put(SuratAlKahfController());
    return Scaffold(
      appBar:AppBar(
        iconTheme:IconThemeData(color:context.isDarkMode?AppColor.white:AppColor.black),
          toolbarHeight: 35,
          systemOverlayStyle:context.isDarkMode? SystemUiOverlayStyle.dark:
          SystemUiOverlayStyle.light,
          surfaceTintColor:const Color(0xFF5E4840)),
      body:InteractiveViewer(
        minScale: 1,
        maxScale: 1.24,
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          child:ListView.builder(itemCount:controller.images.length,
              itemBuilder: (context, index) =>
                  Center(
                    child: Image.asset(controller.images[index],
                       fit:BoxFit.fitWidth,),
                  )
            ,),
        ),
      ),
    );
  }
}
