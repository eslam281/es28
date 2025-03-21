import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/elathaker_controller.dart';

class Althakr extends StatelessWidget {
  const Althakr({super.key});

  @override
  Widget build(BuildContext context) {
    ElathakerController controller = Get.put(ElathakerController());
    return  Column(crossAxisAlignment:CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30,),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...List.generate(controller.adhkar.length, (index) =>
                Column(
                  children: [
                    Card(child:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.adhkar[index],style:const TextStyle(fontSize: 20,),
                        textDirection:TextDirection.rtl,),
                    ),),
                    const SizedBox(height: 10,)
                  ],
                ),)
            ],
          ),
        const SizedBox(height: 30,)
      ],);
  }
}
