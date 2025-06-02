import 'package:es28/core/constant/color.dart';
import 'package:es28/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../component/athkar/customBouttonMain.dart';


class Althakr extends StatelessWidget {
  const Althakr({super.key});

  @override
  Widget build(BuildContext context) {
   return const Center(
     child: Column(
       mainAxisAlignment:MainAxisAlignment.spaceEvenly,
       children: [

         CustomButtonMain(name:"اذكار الصباح والمساء",pageName:AppRoute.athkar_SM ,),

         CustomButtonMain(name:"اذكار بعد الصلاة",pageName:AppRoute.athkarAP ,),

         CustomButtonMain(name:"اذكار يوم الجمعة",pageName:AppRoute.athkarFriday,),

       ],
     ),
   );
  }
}
