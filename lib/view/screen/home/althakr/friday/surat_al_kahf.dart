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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("سورة الكهف", style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
            color: context.isDarkMode ? AppColor.white : AppColor.black),
        systemOverlayStyle:
            context.isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900, Colors.black]
                : [Colors.white, Colors.grey.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 2.0,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: controller.images.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    controller.images[index],
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
