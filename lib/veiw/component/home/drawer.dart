import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constant/imageasset.dart';
import '../../screen/drawer/Aboutus.dart';
import '../../screen/drawer/Qibla.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      width: 220,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          textDirection:TextDirection.rtl,
          children: [
            const SizedBox(height: 20,),
            SizedBox(
              height: 100,
              child:Image.asset(AppImageAsset.logo,width: 200,fit:BoxFit.fitWidth,),
            ),
            const SizedBox(height: 50,),

            ListTile(
                title: const Text("اتصل بنا"),
                leading: const Icon(Icons.comment_outlined),
                onTap: () async {
                  // await launchUrl(Uri.parse("https://wa.me/201064744978"));
                  // await launchUrl(Uri.parse("tel:0201064744978"));
                  await launchUrl(
                      Uri.parse("mailto:aslamsydbdalzyzbry@gmail.com"));
                }),

            Container(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text("معلومات عنا"), leading: const Icon(Icons.info),
                onTap: () {
                  Get.to(() => const About_us());
                },
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text("القبلة"), leading: const Icon(Icons.directions_outlined),
                onTap: () {
                  Get.to(() => const QiblaPage());
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
