import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../component/drawer/linkTile.dart';
import '../../component/drawer/sectionTitle.dart';


class Contact_Us extends StatelessWidget {
  const Contact_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تواصل معنا',
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.secondColor),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /// Section Title
            sectionTitle('معلومات التواصل'),

            const SizedBox(height: 30),

            // Email
            linkTile(
              context,
              title: '📧 aslamsydbdalzyzbry@gmail.com',
              url: "mailto:aslamsydbdalzyzbry@gmail.com",
              icon: Icons.email,
            ),

            const SizedBox(height: 30),

            // GitHub
            linkTile(
              context,
              title: 'GitHub',
              url: 'https://github.com/eslam281',
              icon: Icons.code,
            ),

            const SizedBox(height: 30),

            // LinkedIn
            linkTile(
              context,
              title: 'LinkedIn',
              url: 'https://linkedin.com/in/islam-sayed-a2a8b4259',
              icon: Icons.business_center,
            ),

          ],
        ),
      ),
    );
  }
}
