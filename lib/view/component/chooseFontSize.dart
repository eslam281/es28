import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class ChooseFontSize extends StatelessWidget {
  final void Function() onPressedIncrease;
  final void Function() onPressedDecrease;
  const ChooseFontSize({super.key, required this.onPressedIncrease, required this.onPressedDecrease});

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColor.secondColor.withAlpha(30),
          child: Icon(Icons.text_fields, color: AppColor.secondColor),
        ),
        title: const Text(
          "حجم النص",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: const Text("قم بتكبير أو تصغير حجم النص"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Text("-A", style: TextStyle(color: AppColor.secondColor)),
              onPressed: onPressedDecrease,
            ),
            IconButton(
              icon: Text("+A", style: TextStyle(color: AppColor.secondColor)),
              onPressed: onPressedIncrease,
            ),
          ],
        ),
      ),
    );
  }
}
