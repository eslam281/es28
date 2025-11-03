import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TimesCard extends StatelessWidget {
  final String textDate;
  final String textLocation;
  final bool isReady;
  final void Function() reTimes;

  const TimesCard(
      {super.key,
      required this.textDate,
      required this.textLocation,
      required this.isReady,
      required this.reTimes
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              textDate,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            Text(
              textLocation,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            IconButton(
              onPressed: reTimes,
              icon: const Icon(Icons.refresh, size: 26),
              color: isReady ? AppColor.secondColor : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
