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
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
        const Text('  • ', style: TextStyle(color: Colors.white, fontSize: 18))
        ],
      ),
    ))
        .toList(),
  );
}