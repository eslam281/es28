import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('من أنا', style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.indigo.shade900.withAlpha(50), Colors.black]
                : [Colors.white, Colors.blue.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// Hero Section (Profile Header)
                _buildProfileHeader(context),

                const SizedBox(height: 30),

                /// Skills Section
                _buildGlassSection(
                  context,
                  title: 'المهارات التقنية',
                  icon: Icons.code_rounded,
                  content: [
                    'حل المشكلات، هياكل البيانات والخوارزميات',
                    'مبادئ OOP وهندسة البرمجيات الحديثة',
                    'قواعد البيانات العلائقية (MySQL)',
                    'إتقان Flutter, Dart, REST API, Git'
                  ],
                ),

                const SizedBox(height: 20),

                /// Projects Section
                _buildGlassSection(
                  context,
                  title: 'أبرز المشاريع',
                  icon: Icons.rocket_launch_rounded,
                  content: [
                    'نظام متجر إلكتروني متكامل (3 تطبيقات)',
                    'واجهة مستخدم متجاوبة باستخدام GetX',
                    'باك إند متطور باستخدام PHP و MySQL',
                    'أنظمة تتبع ودفع إلكتروني ذكية'
                  ],
                ),

                const SizedBox(height: 20),

                /// Personal Skills Section
                _buildGlassSection(
                  context,
                  title: 'المهارات الشخصية',
                  icon: Icons.psychology_rounded,
                  content: [
                    'حب مشاركة المعرفة والتطوع التقني',
                    'القدرة على العمل الجماعي وقيادة الفرق',
                    'احترام أخلاقيات العمل والاحترافية',
                    'البحث السريع وإيجاد حلول إبداعية'
                  ],
                ),

                const SizedBox(height: 40),
                
                // Quote at the bottom
                const Text(
                  "\"البرمجة ليست مجرد كود، بل هي فن حل المشكلات\"",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [AppColor.secondColor, AppColor.secondColor.withBlue(200)],
            ),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person_rounded, size: 60, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          'إسلام سيد عبد العزيز',
          style: TextStyle(
            fontSize: 28,
            color: AppColor.secondColor,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        const Text(
          'مطور تطبيقات موبايل (Flutter)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const Text(
          'كلية الحاسبات والمعلومات - أكاديمية طيبة',
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGlassSection(BuildContext context,
      {required String title, required IconData icon, required List<String> content}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColor.secondColor.withAlpha(30)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: AppColor.secondColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: AppColor.secondColor),
                ],
              ),
              const Divider(height: 20, thickness: 0.5),
              ...content.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            item,
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(Icons.check_circle_rounded, size: 16, color: AppColor.secondColor),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
