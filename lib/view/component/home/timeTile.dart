import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class LuxuryTimeTile extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;
  final Color accentColor;
  final bool isPassed;
  final bool isNext;

  const LuxuryTimeTile({
    super.key,
    required this.title,
    required this.time,
    required this.icon,
    required this.accentColor,
    this.isPassed = false,
    this.isNext = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: isNext
            ? LinearGradient(
                colors: [accentColor.withAlpha(80), accentColor.withAlpha(20)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isNext
            ? null
            : (context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5)),
        border: Border.all(
          color: isNext ? accentColor.withAlpha(150) : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: isNext
            ? [
                BoxShadow(
                  color: accentColor.withAlpha(40),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ]
            : [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon Jewel
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isNext ? accentColor : accentColor.withAlpha(40),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: isNext
                        ? [
                            BoxShadow(
                              color: accentColor.withAlpha(120),
                              blurRadius: 10,
                            )
                          ]
                        : [],
                  ),
                  child: Icon(
                    icon,
                    color: isNext ? Colors.white : accentColor,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 20),
                // Text Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: isNext ? FontWeight.w900 : FontWeight.bold,
                          color: isPassed ? Colors.grey : (isNext ? accentColor : null),
                          decoration: isPassed ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      if (isNext)
                        Text(
                          "الصلاة القادمة",
                          style: TextStyle(
                            fontSize: 12,
                            color: accentColor.withAlpha(200),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
                // Time Display
                Text(
                  time.substring(0, 5),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: isPassed ? Colors.grey : (isNext ? accentColor : null),
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
}
