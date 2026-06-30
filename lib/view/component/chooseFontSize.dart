import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class ChooseFontSize extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onPressedIncrease;
  final void Function() onPressedDecrease;
  const ChooseFontSize({
    super.key,
    required this.onPressedIncrease,
    required this.onPressedDecrease,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: AppColor.secondColor.withAlpha(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.secondColor.withAlpha(30),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.format_size, color: AppColor.secondColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).dividerColor.withAlpha(10),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: onPressedDecrease,
                    icon: Icon(Icons.remove_circle_outline,
                        color: AppColor.secondColor),
                    tooltip: "تصغير",
                  ),
                  const VerticalDivider(width: 1),
                  IconButton(
                    onPressed: onPressedIncrease,
                    icon: Icon(Icons.add_circle_outline,
                        color: AppColor.secondColor),
                    tooltip: "تكبير",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
