import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

Widget timeTile(String title, String? time,BuildContext context) {
  return Card(
    color:context.isDarkMode? Colors.grey.shade800 :Colors.grey.shade200,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time!.substring(0, 5),
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColor.secondColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}