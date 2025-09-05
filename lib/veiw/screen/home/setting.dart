import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50,),
            Card(child:
            IconButton(icon:context.isDarkMode?const Icon(Icons.dark_mode) :
            const Icon(Icons.light_mode),
                onPressed: () {
                  Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
                  Get.appUpdate();
                }),),
        ],),
    );
  }
}
