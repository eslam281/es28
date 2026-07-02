import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';

class CustomAthkarCard extends StatelessWidget {
  final String elthakr;
  final int max;
  final int count;
  final double textScaler;
  final bool completed;
  final void Function() onTap;
  final void Function() edit;
  final void Function() delete;
  const CustomAthkarCard({
    super.key,
    required this.elthakr,
    required this.max,
    required this.count,
    required this.onTap,
    required this.completed,
    required this.textScaler,
    required this.edit,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    double progress = count / max;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: completed
            ? Colors.green.withAlpha(20)
            : (context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5)),
        border: Border.all(
          color: completed ? Colors.green.withAlpha(100) : AppColor.secondColor.withAlpha(30),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          // Progress Bar at the very top of the card
          if (!completed)
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(AppColor.secondColor.withAlpha(100)),
                minHeight: 4,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Top Row: Edit/Delete Actions
                Row(
                  children: [
                    _buildSmallAction(Icons.edit_rounded, onTap: edit),
                    const SizedBox(width: 8),
                    _buildSmallAction(
                      Icons.delete_outline_rounded,
                      onTap: () => alertApp("هل تريد حذف هذا الذكر؟", "حذف", delete),
                    ),
                    const Spacer(),
                    if (completed)
                      const Icon(Icons.check_circle_rounded, color: Colors.green, size: 24),
                  ],
                ),
                const SizedBox(height: 12),
                // The Thikr Text
                Text(
                  elthakr,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textScaler: TextScaler.linear(textScaler),
                ),
                const SizedBox(height: 20),
                // Bottom Row: Progress text and Counter Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColor.secondColor.withAlpha(20),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '$count / $max',
                        style: TextStyle(
                          color: completed ? Colors.green : AppColor.secondColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          fontFamily: 'monospace',
                        ),
                        textScaler: TextScaler.linear(textScaler),
                      ),
                    ),
                    GestureDetector(
                      onTap: completed ? null : onTap,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                          gradient: completed
                              ? null
                              : LinearGradient(
                                  colors: [
                                    AppColor.secondColor,
                                    AppColor.secondColor.withBlue(150),
                                  ],
                                ),
                          color: completed ? Colors.green.withAlpha(50) : null,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: completed
                              ? []
                              : [
                                  BoxShadow(
                                    color: AppColor.secondColor.withAlpha(80),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                        ),
                        child: Text(
                          completed ? 'تـم' : 'تسبيح',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          textScaler: TextScaler.linear(textScaler),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallAction(IconData icon, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(20),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColor.secondColor.withAlpha(150), size: 18),
      ),
    );
  }
}
