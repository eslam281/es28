import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAthkarCard extends StatelessWidget {
  final String elthakr;
  final int max;
  final int count;
  final bool completed;
  final void Function() onTap;
  const CustomAthkarCard({super.key, required this.elthakr,
    required this.max, required this.count, required this.onTap, required this.completed});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
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
              style: const TextStyle(fontSize: 15),
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
                  ),
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
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('تسبيح'),
                  ),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
