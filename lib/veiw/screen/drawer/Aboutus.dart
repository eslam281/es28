import 'package:flutter/material.dart';
class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar()
      ,body:
    Container(
      alignment:Alignment.topCenter,
      padding:const EdgeInsets.all(20),
        child: const Text(
            "مرحباً \n\n أنا إسلام، أنا مطور هذا التطبيق.",
          style:TextStyle(fontSize:25),
          textAlign:TextAlign.center,textDirection:TextDirection.rtl,))
      ,);
  }
}
