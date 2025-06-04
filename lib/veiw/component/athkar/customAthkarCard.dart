import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAthkarCard extends StatelessWidget {
  final String elthakr;
  final int max;
  final int count;
  final void Function()? onTap;
  const CustomAthkarCard({super.key, required this.elthakr,
    required this.max, required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisSize:MainAxisSize.min,
          children: [
            Container(
              padding:const EdgeInsets.symmetric(horizontal: 5),
              decoration:const BoxDecoration(
                  borderRadius:BorderRadius.only(topLeft:Radius.circular(20))
                  ,color: AppColor.primaryColor),
              alignment:Alignment.center,
              child:Text("$count / $max",style:
              const TextStyle(fontSize:20,color:AppColor.white),),
            ),
          ],
        ),

        InkWell(
          onTap:onTap,
          child: Card(
            color: AppColor.primaryColor,margin: EdgeInsets.zero,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(elthakr,style:const
              TextStyle(fontSize: 20,color: AppColor.white),
                textDirection:TextDirection.rtl,),
            ),),
        ),

        const SizedBox(height: 20,)
      ],
    );
  }
}
