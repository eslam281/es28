import 'package:es28/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constant/routes.dart';

class AthkarFriday extends StatelessWidget {
  const AthkarFriday({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "أذكار الجمعة",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900, Colors.black]
                : [Colors.white, Colors.grey.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFridayButton(
                  context,
                  title: "سورة الكهف",
                  icon: Icons.menu_book_rounded,
                  onTap: () {
                    Get.toNamed(AppRoute.surat_Al_Kahf);
                  },
                ),
                const SizedBox(height: 30),
                _buildFridayButton(
                  context,
                  title: "الصلاة على النبي",
                  icon: Icons.auto_awesome_rounded,
                  onTap: () {
                    Get.toNamed(AppRoute.prayElnaby);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFridayButton(BuildContext context,
      {required String title, required IconData icon, required VoidCallback onTap}) {
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
