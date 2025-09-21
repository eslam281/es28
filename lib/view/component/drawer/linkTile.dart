import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constant/color.dart';


Widget linkTile(
    BuildContext context, {
      required String title,
      required String url,
      IconData? icon, // optional icon
    }) {
  return InkWell(
    onTap: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تعذر فتح الرابط')),
        );
      }
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.secondColor.withValues(alpha: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// Text
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,decorationThickness: 1,
              ),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),

          /// Optional Icon
          if (icon != null) ...[
            const SizedBox(width: 10),
            Icon(icon, color: AppColor.secondColor),
          ],
        ],
      ),
    ),
  );
}
