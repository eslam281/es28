import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

Widget timeTile(String title, String? time) {
  return Card(
    color: Colors.grey.shade800,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: const EdgeInsets.only(bottom: 16),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            time!,
            style: const TextStyle(fontSize: 20, color: Colors.white),
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