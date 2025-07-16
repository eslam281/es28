import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomButtonMain extends StatelessWidget {
  final String name;
  final String pageName;
  final IconData? icon;

  const CustomButtonMain({
    super.key,
    required this.name,
    required this.pageName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(pageName),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.secondColor, width: 1.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(width: 10),
            Icon(icon ?? Icons.menu_book, color: AppColor.secondColor),
          ],
        ),
      ),
    );
  }
}
