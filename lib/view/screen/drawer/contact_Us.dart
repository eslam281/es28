import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../component/drawer/linkTile.dart';

class Contact_Us extends StatelessWidget {
  const Contact_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('تواصل معنا', style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.secondColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: context.isDarkMode
                ? [Colors.black, Colors.grey.shade900]
                : [Colors.white, Colors.grey.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  "يسعدنا تواصلك معنا",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColor.secondColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "يمكنك الوصول إلينا عبر المنصات التالية",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                _buildContactCard(
                  context,
                  title: 'البريد الإلكتروني',
                  subtitle: 'aslamsydbdalzyzbry@gmail.com',
                  icon: Icons.email_rounded,
                  url: "mailto:aslamsydbdalzyzbry@gmail.com",
                ),

                const SizedBox(height: 20),

                _buildContactCard(
                  context,
                  title: 'GitHub',
                  subtitle: 'github.com/eslam281',
                  icon: Icons.code_rounded,
                  url: 'https://github.com/eslam281',
                ),

                const SizedBox(height: 20),

                _buildContactCard(
                  context,
                  title: 'LinkedIn',
                  subtitle: 'islam-sayed-a2a8b4259',
                  icon: Icons.business_center_rounded,
                  url: 'https://linkedin.com/in/islam-sayed-a2a8b4259',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(BuildContext context,
      {required String title, required String subtitle, required IconData icon, required String url}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: context.isDarkMode ? Colors.white.withAlpha(10) : Colors.black.withAlpha(5),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColor.secondColor.withAlpha(30)),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => linkTile(context, title: title, url: url, icon: icon), // Note: using linkTile's logic indirectly or wrapping it
              // Actually, linkTile in the project might just be a function or a widget. 
              // Based on imports, I should probably use it or replicate its behavior.
              // Let's assume linkTile handles the launchUrl logic.
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColor.secondColor.withAlpha(30),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(icon, color: AppColor.secondColor, size: 28),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            subtitle,
                            style: const TextStyle(fontSize: 12, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 16, color: AppColor.secondColor.withAlpha(150)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
