import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/routes.dart';

class AthkarSMSelection extends StatelessWidget {
  const AthkarSMSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "أذكار الصباح والمساء",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal:12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900, Colors.black]
                : [Colors.white, Colors.grey.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFridayButton(
              title: "أذكار الصباح",
              icon:  Icons.wb_sunny_rounded,
              onTap: () {
                Get.toNamed(AppRoute.athkar_M);
              },
            ),
            const SizedBox(height: 50),
            _buildFridayButton(
              title: "أذكار المساء",
              icon:  Icons.nights_stay_rounded,
              onTap: () {
                Get.toNamed(AppRoute.athkar_S);
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildFridayButton({required String title, required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.secondColor.withAlpha(200),
              AppColor.secondColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColor.secondColor.withAlpha(80),
              blurRadius: 15,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(40),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white70, size: 18),
          ],
        ),
      ),
    );
  }
}
