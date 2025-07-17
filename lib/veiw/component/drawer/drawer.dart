import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/imageasset.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      surfaceTintColor:Colors.blue,
      backgroundColor: AppColor.black,
      shadowColor:AppColor.secondColor,elevation: 70,
      width: 200,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            textDirection:TextDirection.rtl,
            children: [
              const SizedBox(height: 20,),
              SizedBox(
                height: 100,
                child:Image.asset(AppImageAsset.logo,width: 200,fit:BoxFit.fitWidth,),
              ),
              const SizedBox(height: 50,),

              Container(
                margin:const EdgeInsets.only(top: 10),
                color:AppColor.secondColor,
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: const Text("القبلة"), leading: const Icon(Icons.directions_outlined),
                  onTap: () {
                    Get.toNamed(AppRoute.qiblaPage);
                  },
                ),
              ),

              Container(
                margin:const EdgeInsets.only(top: 10),
                color:AppColor.secondColor,
                child: ListTile(
                    title: const Text("اتصل بنا"),
                    leading: const Icon(Icons.comment_outlined),
                    onTap: () async {
                      Get.toNamed(AppRoute.contact_us);
                    }),
              ),

              Container(
                margin:const EdgeInsets.only(top: 10),
                color:AppColor.secondColor,
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: const Text("معلومات عنا"), leading: const Icon(Icons.info),
                  onTap: () {
                    Get.toNamed(AppRoute.about_us);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
