import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/color.dart';

class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: const Text(
          'من أنا',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'إسلام سيد عبدالعزيز',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColor.secondColor,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 10),
              const Text(
                'طالب بكلية الحاسبات والمعلومات - أكاديمية طيبة (متوقع التخرج 2026)',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 20),

              sectionTitle('المهارات'),
              bulletList([
                'حل المشكلات، هياكل البيانات والخوارزميات',
                'مبادئ OOP وهندسة البرمجيات',
                'قواعد البيانات العلائقية والعلوم النظرية',
                'إتقان أدوات مثل Flutter، Dart، MySQL، Git، Postman، XAMPP'
              ]),

              const SizedBox(height: 20),

              sectionTitle('أبرز المشاريع'),
              const Text(
                'تطبيق متجر إلكتروني مكون من 3 تطبيقات (عميل - مسؤول - مندوب):',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textDirection: TextDirection.rtl,
              ),
              bulletList([
                'واجهة مستخدم متجاوبة باستخدام Flutter و GetX',
                'باك إند باستخدام PHP و MySQL و REST API',
                'أنظمة تسجيل دخول وصلاحيات متعددة',
                'تتبع الطلبات والدفع وتحديث حالة التوصيل'
              ]),

              const SizedBox(height: 20),

              sectionTitle('المهارات الشخصية'),
              bulletList([
                'أحب مشاركة المعرفة والتطوع',
                'القدرة على العمل ضمن فريق وقيادة المجموعة',
                'احترام أخلاقيات العمل',
                'البحث السريع وحل المشاكل البرمجية'
              ]),

              const SizedBox(height: 20),

              sectionTitle('معلومات التواصل'),
              linkTile(
                context,
                title: '📧 aslamsydbdalzyzbry@gmail.com',
                url: "mailto:aslamsydbdalzyzbry@gmail.com"
              ),
              const SizedBox(height: 10),

              /// Clickable Links
              linkTile(
                context,
                title: 'GitHub',
                url: 'https://github.com/eslam281',
              ),
              const SizedBox(height: 10),
              linkTile(
                context,
                title: 'LinkedIn',
                url: 'https://linkedin.com/in/islam-sayed-a2a8b4259',
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColor.secondColor,
      ),
      textDirection: TextDirection.rtl,
    );
  }

  Widget bulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: items
          .map((item) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text('• ', style: TextStyle(color: Colors.white, fontSize: 18)),
            Expanded(
              child: Text(
                item,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ))
          .toList(),
    );
  }

  Widget linkTile(BuildContext context, {required String title, required String url}) {
    return InkWell(
      onTap: () async {
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تعذر فتح الرابط')),
          );
        }
      },
      child: Text(
        '🔗 $title: $url',
        style: const TextStyle(
          color: Colors.blueAccent,
          decoration: TextDecoration.underline,
          fontSize: 16,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
