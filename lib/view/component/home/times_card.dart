import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TimesCard extends StatelessWidget {
  final String textDate;
  final String textLocation;
  final bool isReady;
  final void Function() reTimes;

  const TimesCard({
    super.key,
    required this.textDate,
    required this.textLocation,
    required this.isReady,
    required this.reTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.secondColor,
            AppColor.secondColor.withAlpha(150),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: AppColor.secondColor.withAlpha(80),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textDate,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white70, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    textLocation,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: reTimes,
            icon: Icon(
              Icons.refresh_rounded,
              size: 30,
              color: isReady ? Colors.white : Colors.white54,
            ),
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withAlpha(40),
              padding: const EdgeInsets.all(12),
            ),
          ),
        ],
      ),
    );
  }
}
