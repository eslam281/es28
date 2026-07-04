import 'dart:ui';
import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertApp(String middleText, String acceptText, void Function() onPressed) {
  return Get.defaultDialog(
    backgroundColor: Colors.transparent,
    title: "", // Hide default title
    content: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.black.withAlpha(150) : Colors.white.withAlpha(200),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColor.secondColor.withAlpha(50), width: 1.5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.secondColor.withAlpha(30),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.exit_to_app_rounded, color: AppColor.secondColor, size: 40),
              ),
              const SizedBox(height: 20),
              const Text(
                "تنبيه",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                middleText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: _buildDialogButton(
                      text: acceptText,
                      colors: [Colors.red.shade400, Colors.red.shade700],
                      onTap: onPressed,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _buildDialogButton(
                      text: "إلغاء",
                      colors: [Colors.green.shade400, Colors.green.shade700],
                      onTap: () => Get.back(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildDialogButton({required String text, required List<Color> colors, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: colors.first.withAlpha(100),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    ),
  );
}
