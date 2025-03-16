import 'package:flutter/material.dart';
class About_us extends StatelessWidget {
  const About_us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body:
    Container(
      padding:EdgeInsets.all(20),
        child: const Text(
            "Hello \n I am Islam , I the developer of this app",
          style:TextStyle(fontSize:25),
          textAlign:TextAlign.center,))
      ,);
  }
}
