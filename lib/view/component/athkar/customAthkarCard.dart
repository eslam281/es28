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
  const CustomAthkarCard({super.key, required this.elthakr,
    required this.max, required this.count, required this.onTap, required this.completed,
    required this.textScaler, required this.edit, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      color: completed ? Colors.green.withValues(alpha: 0.15) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            // ----------  Row of Edit/Delete  ----------
            Row(
              children: [
                IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.edit_outlined, color: AppColor.secondColor),
                ),
                IconButton(
                  onPressed:() {
                    alertApp("هل تريد حذف هذا الذكر؟","حذف",delete);
                  } ,
                  icon: Icon(Icons.delete_forever, color: AppColor.secondColor),
                ),
                const Spacer(),
              ],
            ),

            // ----------  Text  ----------
            Text(
              textDirection: TextDirection.rtl,
              elthakr,
              style: const TextStyle(fontSize: 15),
              textScaler: TextScaler.linear(textScaler),
            ),
            const SizedBox(height: 12),

            // ----------  Counter + Button ----------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$count / $max',
                  style: TextStyle(
                    color: completed ? Colors.green : null,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaler: TextScaler.linear(textScaler),
                ),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: completed
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : ElevatedButton(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.secondColor,
                      foregroundColor: context.isDarkMode ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'تسبيح',
                      textScaler: TextScaler.linear(textScaler),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }
}
