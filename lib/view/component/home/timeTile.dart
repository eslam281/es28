import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

Widget timeTile(String title, String? time, BuildContext context, {bool isNext = false}) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: isNext
          ? LinearGradient(
              colors: [
                AppColor.secondColor.withAlpha(50),
                AppColor.secondColor.withAlpha(20),
              ],
            )
          : null,
      color: isNext ? null : (context.isDarkMode ? Colors.white.withAlpha(5) : Colors.black.withAlpha(5)),
      border: Border.all(
        color: isNext ? AppColor.secondColor.withAlpha(150) : Colors.transparent,
        width: 1.5,
      ),
      boxShadow: isNext
          ? [
              BoxShadow(
                color: AppColor.secondColor.withAlpha(40),
                blurRadius: 15,
                spreadRadius: 2,
              )
            ]
          : [],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isNext ? AppColor.secondColor : AppColor.secondColor.withAlpha(30),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: isNext
                      ? [
                          BoxShadow(
                            color: AppColor.secondColor.withAlpha(100),
                            blurRadius: 8,
                          )
                        ]
                      : [],
                ),
                child: Icon(
                  _getPrayerIcon(title),
                  color: isNext ? Colors.white : AppColor.secondColor,
                  size: 26,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: isNext ? FontWeight.w900 : FontWeight.bold,
                        color: isNext ? AppColor.secondColor : null,
                      ),
                    ),
                    if (isNext)
                      const Text(
                        "الصلاة القادمة",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                time!.substring(0, 5),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: isNext ? AppColor.secondColor : null,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

IconData _getPrayerIcon(String title) {
  if (title.contains("الفجر")) return Icons.wb_twilight_rounded;
  if (title.contains("شروق")) return Icons.wb_sunny_rounded;
  if (title.contains("الظهر")) return Icons.sunny_snowing;
  if (title.contains("العصر")) return Icons.wb_cloudy_rounded;
  if (title.contains("المغرب")) return Icons.nights_stay_rounded;
  if (title.contains("العشاء")) return Icons.dark_mode_rounded;
  return Icons.access_time_filled_rounded;
}
