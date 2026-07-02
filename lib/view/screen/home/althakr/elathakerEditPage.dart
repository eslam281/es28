import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';

class ElathakerEditPage extends StatefulWidget {
  final int? index;
  final dynamic controller;
  const ElathakerEditPage({super.key, this.index, required this.controller});

  @override
  State<ElathakerEditPage> createState() => _ElathakerEditPageState();
}

class _ElathakerEditPageState extends State<ElathakerEditPage> {
  late TextEditingController textController;
  late TextEditingController countController;

  @override
  void initState() {
    textController = TextEditingController();
    countController = TextEditingController();
    if (widget.index != null) {
      textController.text = widget.controller.athkar[widget.index!][0];
      countController.text = widget.controller.athkar[widget.index!][1].toString();
    }
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.index == null ? "إضافة ذكر جديد" : "تعديل الذكر",
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildGlassInput(
                  context,
                  controller: textController,
                  label: "نص الذكر",
                  icon: Icons.edit_note_rounded,
                  hint: "اكتب الذكر هنا...",
                  maxLines: 4,
                ),
                const SizedBox(height: 25),
                _buildGlassInput(
                  context,
                  controller: countController,
                  label: "العدد المطلوب",
                  icon: Icons.numbers_rounded,
                  hint: "مثال: 33",
                  keyboard: TextInputType.number,
                ),
                const Spacer(),
                _buildGradientButton(
                  context,
                  text: widget.index == null ? "إضافة الآن" : "حفظ التعديلات",
                  icon: widget.index == null ? Icons.add_task_rounded : Icons.save_as_rounded,
                  onTap: () {
                    if (textController.text.isNotEmpty && countController.text.isNotEmpty) {
                      if (widget.index == null) {
                        widget.controller.add(
                          textController.text,
                          int.parse(countController.text),
                        );
                      } else {
                        widget.controller.edit(
                          widget.index!,
                          textController.text,
                          int.parse(countController.text),
                        );
                      }
                    } else {
                      Get.snackbar("تنبيه", "يرجى ملء جميع الحقول",
                          backgroundColor: Colors.red.withAlpha(100), colorText: Colors.white);
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGlassInput(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    int maxLines = 1,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              color: AppColor.secondColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColor.secondColor.withAlpha(30)),
              ),
              child: TextField(
                controller: controller,
                maxLines: maxLines,
                keyboardType: keyboard,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 16),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(icon, color: AppColor.secondColor, size: 22),
                  contentPadding: const EdgeInsets.all(20),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGradientButton(
    BuildContext context, {
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.secondColor, AppColor.secondColor.withBlue(150)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.secondColor.withAlpha(80),
              blurRadius: 12,
              offset: const Offset(0, 6),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(width: 12),
            Icon(icon, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }
}

