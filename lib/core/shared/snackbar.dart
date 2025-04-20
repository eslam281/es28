
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String content;
  const CustomSnackBar({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(content,textDirection:TextDirection.rtl,),
    backgroundColor:Colors.white,);
  }
}
