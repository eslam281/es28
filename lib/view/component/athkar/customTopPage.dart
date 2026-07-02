import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';

class CustomTopPage extends StatelessWidget {
  final void Function() changeThemeMode;
  final void Function() restore;
  final void Function() increaseTextSize;
  final void Function() decreaseTextSize;
  const CustomTopPage({
    super.key,
    required this.changeThemeMode,
    required this.restore,
    required this.increaseTextSize,
    required this.decreaseTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? Colors.white.withAlpha(20)
                  : Colors.black.withAlpha(10),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppColor.secondColor.withAlpha(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildActionButton(
                  context,
                  icon: context.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  onTap: changeThemeMode,
                ),
                _buildActionButton(
                  context,
                  icon: Icons.restore_rounded,
                  onTap: () {
                    alertApp(
                      "هل تريد استعادة كافة البيانات؟",
                      "موافق",
                      restore,
                    );
                  },
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.secondColor.withAlpha(20),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      _buildSizeButton(context, "-ض", onTap: decreaseTextSize),
                      const SizedBox(width: 5),
                      Icon(Icons.text_fields_rounded,
                          color: AppColor.secondColor, size: 20),
                      const SizedBox(width: 5),
                      _buildSizeButton(context, "+ض", onTap: increaseTextSize),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context,
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.secondColor.withAlpha(30),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColor.secondColor, size: 24),
      ),
    );
  }

  Widget _buildSizeButton(BuildContext context, String text,
      {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.secondColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
