import 'package:flutter/material.dart';

Widget bulletList(List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: items
        .map((item) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Expanded(
            child: Text(
              item,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
        const Text('  • ', style: TextStyle(fontSize: 18))
        ],
      ),
    ))
        .toList(),
  );
}