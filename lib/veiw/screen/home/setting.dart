import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/test7_controller.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Modle>(builder: (controller) =>
        Column(
          children: [
            SizedBox(height: 50,),
            Card(child:ListTile(title:  const Text("counter",style: TextStyle(fontSize: 20),),
              trailing: Switch(value: controller.status,
                onChanged: (val) {controller.setStatus(val) ;},),),
            ),
            const SizedBox(height: 30,),

            if(Get.isDarkMode)
              Card(child: IconButton(icon:  Icon(Icons.light_mode),
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                    controller.update();
                  }),),

            if(!Get.isDarkMode)
              Card(child: IconButton(icon: const Icon(Icons.dark_mode), onPressed: (){
                Get.changeTheme(ThemeData.dark());
                controller.update();
              },)
              ),
          ],),
    );
  }
}
