import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomAthkarCard extends StatelessWidget {
  final String elthakr;
  final int max;
  final int count;
  final double textScaler;
  final bool completed;
  final void Function() onTap;
  final void Function() edit;
  const CustomAthkarCard({super.key, required this.elthakr,
    required this.max, required this.count, required this.onTap, required this.completed,
    required this.textScaler, required this.edit});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
            margin: null, padding: null,
          decoration: BoxDecoration(
            color:context.isDarkMode? Colors.black :Colors.white ,
            borderRadius: const BorderRadius.vertical(top:Radius.circular(20) ),
          ),
            child:IconButton(onPressed:edit,icon: const Icon(Icons.edit_outlined,
              color: AppColor.secondColor,),)
        ),
        Card(
          margin: const EdgeInsets.only(bottom: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)),
          color: completed
              ? Colors.green.withValues(alpha: 0.15)
              : null,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  textDirection:TextDirection.rtl ,
                  elthakr,
                  style: const TextStyle(fontSize: 15),textScaler:TextScaler.linear(textScaler)
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$count / $max',
                      style: TextStyle(
                        color: completed ? Colors.green : null,
                        fontWeight: FontWeight.bold,
                      ),textScaler:TextScaler.linear(textScaler)
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child:completed
                          ? const Icon(Icons.check_circle,
                          color: Colors.green)
                          : ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.secondColor,
                          foregroundColor:context.isDarkMode? Colors.black :Colors.white ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('تسبيح'
                        ,textScaler:TextScaler.linear(textScaler) ,),
                      ),
                    )

                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
